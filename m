Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD835346782
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940116; cv=none; b=Q+dd8tDLTxgmCJ7/7l8jHdg6bNZva43sPQD/SY1qInFCWmuuhaPFKPBmwdf8u/x7is02VOfJZ0arPTmDfg5rPXEaJVxtsuiLEzhbkkknnXeqB6io/IXNY26SuKlbsjjq9v0V1ISHLxp4rlev3sqzGma8Alr0jbwLl0z1BP2GE3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940116; c=relaxed/simple;
	bh=J6T6btfjWac6xfTi9g+noTaPKIEXm8WXuA9UYUGOx3g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=MMRzceD30KWKf49wPHAmFBxN3nDHZayKXqgyUOw9MVdQkVhma76cGn6g7WJ3qx4L/wJIWPhBjAVAN/lV00GM6MdDcyFwK62a23crFo93g40e2YMqOSbCJqbWz74K3RmR/ZmfMQuH7dL4qI3uE95nTRC1AQagh8kCVr/vy0Zw9bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FM0kQSXS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FM0kQSXS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so5340249a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790940114; x=1791544914; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Z0srYiA54A8lgqs3OX3sZSJNkoKj+lK/TSgd2dh5Xs=;
        b=FM0kQSXSwGw0MSq+ZrKWrpBeMESi9ZPKdYkvq5Xl3PDb+psUSu5SoqSR2lZhgKqKmo
         +4iOYfxv6w3U9pSPNY2o6ZMAARibhkXGvV8/6o1h0/4kv39aQ3k/AL9IqQRHA9R/szHi
         fp95iMrOt6+DPd2wKtEN9liaP3QjLbeHTDf+xpAFwE9zwK0xOm8EH4q8nT3unL8T2TwR
         Rqmqbca0juRx03aMt+MlZ3ClqotpnUjcyOhcWjZRAITUkQnLr1pbmPcXSfeP0OVoMJnL
         E/FmXo67rvWmiJYWeESJ6xVXElJfhT9Wym8Q/sedRm5fC1DlDIgyLVfbGkqdPWjNhjs5
         GTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940114; x=1791544914;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Z0srYiA54A8lgqs3OX3sZSJNkoKj+lK/TSgd2dh5Xs=;
        b=a7fMFN9In0KuMBXNNHOfivWe6Y5M6B5kaK12nOhNhCLTwclP8DiixWmLyQuyiObms2
         Orj/aOfN8gnEadVgerysFosjGs0/wtlXcq0MBgqWiOhwodXk5dU5EZxyPdDPhJ8EIuWv
         kG8nlKQK6wZGzhp+ymPzfeLxjlHJAuTBlE5Zc+eerOFGSr+qKLkOiqQBbWf2oBYHO9LO
         Hs6lv+HMzt7qVrcndEtjuVfARpZ9Fpin6r0W4xOsIq7uhnq4aAJrYp0+SwzKZUnDPNSS
         frvXacc0XkdDOnhzW8BlLRhpLrkT70zBXcFD4hQSBQmB5RvFbUqEc+tWq75r7ddbTCqu
         /Mdw==
X-Forwarded-Encrypted: i=1; AKwUvByf/dVFeSuBqqsUk0sfWxiS+7g56lSkDYWO4VJDaz8gTUC/LSur/67sIBz/JgDbJZ2Ns1pgaaXqCqrsMNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuNhR3EBPWllt2a7trngcgAbmXOdejL4ekZt9saCnNLJ7GsMTd
	SNV61yk1lgGvvecYq5BIwcEHpbaEmX/wZtBDrPUzG1GaugpsZG/YlbOS
X-Gm-Gg: AYBFou3x7ARaMk1vM0Sn3leL/VKj6OG8Y8oelGZe6uBC9ZX4QqFV26CwdEnkQAocwyN
	3IuJe89uihveyvZJx6EvQ/rPE32f64xraiWNQ2LKAA/1FT10uCne2v+iqOIEggULsmZ9nvUH0Fy
	Ul/yyh4Yzl1RPQY7b8kWWDKu5GIGQF35dIgmiagCSE6O3t7vy3cDELzmLGol++ZXEPo9g9x7PX+
	n5Eh7ky1GQ5GkdUizoSdWaaxjW/WuFSWtPLGkVgHaWUmA5QIUVpMv/X9B5+KmQVEUsi0v2tbhWL
	caf4S2VuzNRtHlUcWs2LcHFoNH2RxmSQTWCIjB0jvK+8m1h6dqc1uVU/YkgMrXAiWkGP9L/lDqF
	85VBVH0DxWt8CK55elIirZOSZuL7eRVqgJyYBniC5wAzfVfLRORKDnFUt/jdbGNCk5k65z6tjqs
	BdkuqW6/DEJAObSscyE7w2/n0OKtwS7WMSDGzV+bpnt8MK7vlPFyTeX8Bsgj0HmaWKWcZeLlb5m
	kx7GWc00/s9T+LXU1sklmB27KaBpwkxuvcPtvDJ2MqJpKWRXyfiMFB5D13+BEgqDg3OBpCoo4yB
	146w
X-Received: by 2002:a17:90b:254c:b0:3a0:cd4d:5133 with SMTP id 98e67ed59e1d1-3a6ce3ba9f9mr1722036a91.2.1790940113693;
        Fri, 02 Oct 2026 04:21:53 -0700 (PDT)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd59187csm3957416a91.10.2026.10.02.04.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:21:53 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:21:52 +0000
Message-Id: <DLUBA9JR5QHY.31UKYQQ9EYMDL@gmail.com>
Cc: "Breno Leitao" <leitao@debian.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf, arm64: Fix text_mutex critical section in
 bpf_arch_text_poke()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Matthew Wood" <thepacketgeek@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
In-Reply-To: <20261002044050.1277356-1-thepacketgeek@gmail.com>
References: <20261002044050.1277356-1-thepacketgeek@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Oct 01, 2026 at 09:40 PM Matthew Wood <thepacketgeek@gmail.com> wrote:
> +	/* pages of the bpf prog pack are shared between progs, so the
> +	 * set_memory_rw()/set_memory_ro() window below must be serialized
> +	 * against other pokers too.
> +	 */
> +	mutex_lock(&text_mutex);
> +
>  	if (plt_target) {
>  		/* non-zero plt_target indicates we're patching a bpf prog,
>  		 * which is read only.
>  		 */
> -		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1))
> -			return -EFAULT;
> +		if (set_memory_rw(PAGE_MASK & ((uintptr_t)&plt->target), 1)) {
> +			ret = -EFAULT;
> +			goto out;
> +		}
>  		WRITE_ONCE(plt->target, plt_target);
>  		set_memory_ro(PAGE_MASK & ((uintptr_t)&plt->target), 1);

The lock hides the crash, but set_memory_rw() is the actual problem.
The page is shared, so it makes 64K of other progs writable and
executable at the same time.
Use aarch64_insn_write_literal_u64(&plt->target, plt_target) instead.
That's how ftrace_rec_set_ops() and arch_static_call_transform()
update 64-bit literals in the text.
It's atomic and writes via fixmap under patch_lock, just like
aarch64_insn_patch_text_nosync() below.
No need to change page permissions and no need to move text_mutex.

pw-bot: cr
