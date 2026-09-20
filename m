Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93923CE0A4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921308; cv=none; b=E0o402ggwVlW+RmSyFBkBGVYNejwBPNtmr4jbizgl1MB9dFq1/SZ+LXiEW46IH3QDUs+w+ctYORBk/XDjD6TQmy57DEoc+/uAOEPXEy3GcS9e+9XNiWG5YEPTGC00XlXufEe2GypS4BM9KTbKWUubCY6RKba+drEG1OSeI5ZwhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921308; c=relaxed/simple;
	bh=qfdM3YubCe2IP79evjGQNlSp/HU4IyfWbW9l+cBm2Rg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=op3sOcROWZn3QpOea87xdOdrjSeq9Gg3+O6VUPDt2I+J9j0Fm6CdhurOIBOGz+8hAhSAc4X4LH5pgSItRBQZcvXuE+xf4rYpWPPgPUNdqcCdyz+N0KukgtcWKnZQbaLqcSyE44T9jfho/uLO4p3aaISd6zNv5+o//DRnV9nrrRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGepoum3; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGepoum3"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1950269a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789921306; x=1790526106; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gy5ssaabRSlN5kBFNvs8mh80/gy44esWLyC1RJAbEbs=;
        b=qGepoum3EieqrlPF7DutwuW8Fc2VyWKRJkCu/M+PyxqYxN6PISB4Ba41CAQy6SUvIt
         ZBYqjtYi/jgBvXej7PPpe3izlR/z0V8yk3OlEb3Qj4CbY2wU63Neui7mte80/EVqefEA
         hEE6gDxLfcLdr0Ij4bzCVh8G7WoDDDaLJ63wpCbkUAyGdD1WU5E0wx2BS92ELIw+2/fj
         I091/bi1WcMT3RVFM26y0lq5orT0ExYCqW9pxZ24hk+bxVEB9OfEoOoRKtMtXTKB+O/j
         OLSyWbQvrCuyAT46+lXIfj4g7cD8HcqWTtuh8ofAeZjsfdvFs4R0k3c2Mam5uZ88/fO5
         +Stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789921306; x=1790526106;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy5ssaabRSlN5kBFNvs8mh80/gy44esWLyC1RJAbEbs=;
        b=vPfxvGF3nFTbTODY/nGCS55IDTmB3Sn2/fWu5RhvknoEd7SzErODg7vxlkl7aOCW3x
         4JI6gCmkiQetlfbJpU6IS3vkF0AEB1mSnWYNiaLm4aUPAFksz8K79g/2CK99KWmPaiBu
         FoVfCkzzPRIbYP5SYttPFYS/WQWjHfxUVeV1q43sYzbbHeKDAGTNdD6Bk7LHGv/sub9u
         ZCcdTjI4xoFQuExHK+D22S4SoVKl+buhq10Vg6uomjTXQoGvXYgOgTpDcKvLYZ5fpt/B
         hztcmTyqdZyKi9DldA7yn4buXYO8mxrpfSDZCjCMTdvSu84HDAQMD+thbtbY2DpHav3S
         dQmw==
X-Forwarded-Encrypted: i=1; AKwUvBz5cb0HPwy9KUchLy9V9dvkh57YagKL3DWh9HnmrR2zo1sXKo7H0gfYudGvzgtyPrYads8aZjyRuJ+qSSM=@vger.kernel.org
X-Gm-Message-State: AFuF++l2hLYdGr95FyHs5YZVrLszSGR+7dgYlQB7JR6TO/N0YlInPDFd
	Yh6f+NItyEEfT7CRL1zU4wQ86lIn5jnZhn8nMdppwXZCCvxKeEaWgo6T
X-Gm-Gg: AYBFou0il4O8WAtSrCot8eLvfPk/XsxpsnuzJNzI1W4m2/MhSGUMP/UmKr1e7AmnYSV
	LgHxsHq2QdRit24V6DH5MwD4Axx/qRoW5knG59XkGp9/N80r92UGEs7i0sEt8yo6R4+Gccu6+uO
	nW3HuYj73DLl/ZW+JyJ1+b9j+p1y5Qcun/43XEw4mMQUng1CFus1/1M2Wh2Sbfgz6xEJKgxTWx2
	AjFxCrPAaFAZWOIBNfd6piqoum6QsCN+Rq/O/NxLuYqLQnTpFXgQUjBu3vKzOPxGkkE5+pJi7u5
	Fg8Y2Ay+LJeB3W+vtMDluiQKcuGWF9nENkU39dBok4ulxcghNkYf2IDkVD/F+uuWvhIlrY0JdEL
	ZABPJoHFnyf9+4RTd9B1E8Z7XB2TSFqIrmHS3nOcWgrfBB4VJqD0nkP5NLGEJNnOiO+oTEgdQrs
	K4lf+kOhs09l7KP2Wf0pz1e0UuIi6LpKnZIIyXQWqBs+t16SIe9PVCEvTxSP4NeBN7UhSx89SQ2
	CnIYkVc5N/e6jjVD58ZBj+zMOjcdwuWh0rSDFoSaPDuY6oc3srbNB7moOB3LZ+s/lafz6yw5bFO
	/El4
X-Received: by 2002:a17:90b:1647:b0:39e:4498:4863 with SMTP id 98e67ed59e1d1-39e54f4187emr17716173a91.10.1789921306000;
        Sun, 20 Sep 2026 09:21:46 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a03bcecdd2sm1495785a91.1.2026.09.20.09.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 09:21:45 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 16:21:44 +0000
Message-Id: <DLKA5BT4JBZD.30HJC03MXC30U@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Zero-fill other CPUs when BPF_F_CPU
 creates a per-cpu hash element
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Donggeun Yoo" <donggeunyoo.kernel@gmail.com>, <bpf@vger.kernel.org>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20260920093153.439743-2-donggeunyoo.kernel@gmail.com>
References: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com> <20260920093153.439743-2-donggeunyoo.kernel@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, Sep 20, 2026 at 06:31 PM Donggeun Yoo <donggeunyoo.kernel@gmail.com> wrote:
> Fixes: c6936161fd55 ("bpf: Add BPF_F_CPU and BPF_F_ALL_CPUS flags support for percpu_hash and lru_percpu_hash maps")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>

Pls cc Leon on respin.

[...]

> @@ -1056,12 +1056,12 @@ static void pcpu_init_value(struct bpf_htab *htab, void __percpu *pptr,
>  	 * known initial values for cpus other than current one
>  	 * (onallcpus=false always when coming from bpf prog).
>  	 */
> -	if (!onallcpus) {
> -		int current_cpu = raw_smp_processor_id();
> +	if (!onallcpus || (map_flags & BPF_F_CPU)) {
> +		int init_cpu = onallcpus ? map_flags >> 32 : raw_smp_processor_id();

The comment above covers only the bpf prog case now.
Pls update it, but one short sentence about BPF_F_CPU is enough.
What you proposed in reply to the bot is too verbose.

pw-bot: cr
