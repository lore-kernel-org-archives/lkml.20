Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785200;
	b=WsPbCt4KDLL64M8gSSK72vibfubNSteTlNMbv0biO9KnxTMaC5Rk/H0BTISexUpmS3Ce
	 /GSPHGdvnH9d+YrRAHvFK3rtRk/jacP3oMc4ZKNGHbJNiJbDV11YVm+UogloC8CJr9KB+
	 RnBpw/E8fLkqor57IxxG/2P0w6SEzYJzJjT1LS7/co/ENaX5VoBRdmvt3h4S9Jgfi3b2i
	 mUBp9hXTRvLK354p0m1I4PK0huqHsG1Dt6UmnE7dctj8f5DZK5jmQHpWfEPdFj5dIQNvJ
	 NLY4FUHJXDz+YXlmKSna+DmzGxa4irlqosGn4+/WPIAIVm11gt9clYJuKHq9zPpE37A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
	b=qaiKkduqbm258h1D3NKh841LRKgKQhlRUc+Vqc2qoEC+K4gh+kURe89DfC4m4vOxD+vW
	 WUmBXtSbgLCL1VL6D1qRRHYTcDSMgcfLNEgxqkJ5lQ+dg3P/4jK6baRFR7mCOSriEpVF2
	 QAI55LPI6gQhtarUCCn1QVYvRRdcCrm+OdrFB9g+1lH/Nd9TFVKkEO90Y1mArX0B0cp0C
	 jnDbBcCa5a6Off109HyD0ztb7fswuG9qKSnaBiwZfYx79uH4XC1bdOaeJmyZFaRzQknGQ
	 jHLJYzAbiZtD2k2wwDu24xeyak+wrgc+i7Hj2qAxKbLG5hk1Zrj2t0jH35vFNbBRiJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gj10Swzo;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0CC606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0CC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gj10Swzo
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1265566a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785199; x=1795389999; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
        b=gj10SwzoKMqoqx9yr7X2Fju4cNBju2Oqd5X0Ay4Y61hHfD7PCDp9yiFRZZggUUCphi
         EgquiXzLIx6aY4R2RTd5ZLyzF7a+dFyArlFGpwOF8hzIuQxpoF1rvqBPTA90bbQtiSc3
         ZX0RVckXRZHz0dFR0n/+vn5BPOC/cB4YcRGnL/oyILEIke66Jod48SG+Qv5PIZtk+cJ3
         a4jGk58g4rcuy6H/nHZi7pTcKmRSJIlcgRxeZ8a/8BRn14ucVJyS4iEkzUGGbVSfsTxE
         PA1L6L9cE4UDQma31GznSkYOnY4WfVQEo52nxdxOSnQrrOnmbWew4sNB0BE/xLjNWEuG
         NuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785199; x=1795389999;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
        b=AbNlVTMdHsXXP76SmtnhK4+m8WbjMjXqwsyANrfAdohnG+g9naV0ZBpQaJ6aa04+lI
         R0B8zqV4iUmq0a4m03wTP654Q8geEyQrocAtrEq99EPej6sW+c4Re4HIlmedsvpBK+Lo
         fh4Dx9QwPiC+r7aORwS9xLy7t1MZhi2bSIoEXM1knQvEoEVr/L3NjpSctoE4PCxxWulI
         gSB4APElBWJGemvIIYt4Zka3VgLmc21iROLG3Dk77YhksqaORjdtaZM+c97hGsJqvrqw
         LTYt2+GE2sM8LkO6RsnxTMRI5XsdwigduO911mog0UVQh9ZnDAxsHiCgapgMqFehl6CN
         Yvpg==
X-Forwarded-Encrypted: i=1; AL+hErHYj4F7bVIUv0+lU5bF8A5+pMKV7PP6M6NDSZ4DbYLJJqfo4QY/1p6zo3S4+4FV3wLPu101wp0prXl6D9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Im70IeClbWDdCg4MwGBdxtfuAqnc/tUNpZy5o9LnhruhPw4Lw
	9YVXFVgzbrxUiMF8wGDpxUA1VbQukF+tOWH7J/ElC+uyR5p3DV4CrUML
X-Gm-Gg: AYBFou1uG3AOWl6Qiur+oOkiepoJvi5TMMl2Cz6EcfU0h+mpO0pb7CmRjPKLBu+myJT
	tbL6IeoaqzIqXlg2MWrS1MB64b8XQXdYSlOtEyRwgeB6RTI/mGVAXcbAbsi7AmoED3dgZ9j5Y6k
	NwKpKhSGx+WDh2Qsc0p0KU+94o76esMje69Ruw1ni/80bmgM1df4jes7E8v/7L+ali/A/twpUzL
	3B1MaxNIaDBRgWqGZsIijp4P8m09wzZguyKQj79ZkniMw2dUbIpMMSal8G+tpSSB95YnW9eYA2x
	VvVPySQwuuEzhynUlBS+AGVuGYFS0JJu5vJvgfToJBg0dU/cfc/oBQ1g03O6Z785SVB2/H6eiVf
	hP/iJLvEH/afWbVaAicOZYRUdM8Ut+TfrlSXMN2YLKmUqvGO6mAACVTWBXaxd37MCHUxF1842qT
	ldxnAwXmGcSM9LkvIliXSi2R6ANcGE7+6e9TtGvcUU6e3BDhuuwVfuhecwXsIWkLhTP9u8O/Zyf
	6G4tahrRFuspU+QZqlLGnKMjIpTkyUFLiZHAaMOeKixYg3gvthEcucWmvf3i8MTYaZxLfwNEGFO
	R+YMgseaqfZ3b+haA3Ciyj5VBGokLSiabyx3NPVdJMcDpp10yAYxUw5owQuTlKGi1FdLOwKYbdl
	GTNL5f3HHwapcvoNztJn20CKsuvgdZM8X7w==
X-Received: by 2002:a17:90b:2e06:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b1b07e1cd4mr8163612a91.6.1794785199420;
        Sun, 15 Nov 2026 15:26:39 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm6832094a91.4.2026.11.15.15.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:26:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 23:26:38 +0000
Message-Id: <DMW695ICRVGM.2YJJUJQ12T0V6@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next v3 0/8] bpf, sockmap: Restrict iter-context
 sockmap updates to sockmap iterators
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Stanislav Fomichev" <sdf@fomichev.me>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
 <DMV5NLOEYFGF.C7ITHCRCNA7P@gmail.com>
 <e8f1736e-3f13-4f92-ad69-8b166c41e68a@rbox.co>
In-Reply-To: <e8f1736e-3f13-4f92-ad69-8b166c41e68a@rbox.co>

On Sun Nov 15, 2026 at 11:10 PM UTC, Michal Luczaj wrote:
> On 11/14/26 19:45, Alexei Starovoitov wrote:
>> On Sat Nov 7, 2026 at 5:58 PM UTC, Michal Luczaj wrote:
>>> Follow-up to Sashiko's report [1] and the decision to restrict which
>>> iterator may perform sockmap updates [2]. Series started short: remove
>>> about-to-be-stale test, restrict updates, add a negative test. Then it
>>> expanded: mark bpf_iter__sockmap::sk as PTR_TRUSTED, restrict
>>> bpf_sock_destroy() callers to iter/{tcp,udp}, few little tweaks.
>>>
>>> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
>>> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
>>>
>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>> ---
>>> Changes in v3:
>>> - Drop RFC prefix
>>> - Update bpf_iter_reg::feature docs
>>> - Fix tcp_request_sock BTF build error
>>> - Restrict allowed callers of bpf_sock_destroy() to iter/{tcp,udp} (Ale=
xei)
>>> - Link to v2: https://patch.msgid.link/20261102-sockmap-update-limit-it=
er-v2-0-e96a63c43b39@rbox.co
>>=20
>> Sorry for the delay. Applied.
>
> No problem, thanks.
>
> To follow up on bpf_iter__unix::unix_sk, looks like there's a single help=
er
> that will become unusable from iter/unix (once plain-PTR_TO_BTF_ID is
> gone): bpf_get_socket_cookie(). PTR_TRUSTED then?

I have a patch that 'forks' bpf_get_socket_cookie() into two helpers.
One for trusted and one for untrusted.

Also have a patch set that removes legacy ptr_to_btf_id for good.
Hopefully will send today or tomorrow.

