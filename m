Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794844991;
	b=si1etzq3W3wEDKczDrNkalT/g15X9WMTm80wrkmIydvCvptp3JYdbz5QJ5iYzrWzgFVj
	 CHiFQZOWzDacHX9gvUA6KfNslZUmv4duOIlf3DpQhygd08R592ud1x882ErZkNpfSLYas
	 dgAyGJzbQaAPc3Y5T76kx2E24R7oaGs2GjAI3rNn0lLbc7qf8E3mySzFwcjnrIzzMbh7I
	 90NnwdMaqTuDKwBpP1fOgJHF8+W8AO3z/vc9TkUEdhtYQyP3eyUUzMzouqs/BcGNujaQJ
	 H3n6hj99HfAlF2crpAUsHs4E8WOcOy+HXqBmyERXJmIPjbTvRrLDdLm3+PvyK1ulCwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
	b=RyGp6LN8R/o4IPMXse0KbEeQM7OgeN1dgdeqgw0JUC0KNhUXIQH1qbq0GtQvFhDqE1qi
	 yQPdCPa4d24XWu2HSIFnsgd6UdBE5RRwVsNf4j1vNDLDE/rgnFk753IddetiOR3dD5c5x
	 HwrQFq2Eh8BJJGcAV5aYRfLVtNGkmDn88bwltrK7SuUZS7xqywoJZdzqDXEhLb9Gf7ge7
	 elFScRKUVhabKGs/DVX9W5eYtsfHz+En4TXmOTaHyWmQN+MznD21pTwdrnq3agi0j/aHI
	 IG4lR/HXPOezcAPosmmkpyS46Yov9xwhqAm2RFBa4TQsWBZg3QXLLpYUIRPlCv1L8rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5+qfPZW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299B606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A299B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5+qfPZW
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea7190aea1so12839345ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794844990; cv=none;
        d=google.com; s=arc-20260327;
        b=hYt+m4VPtVojFqUx8CnWG9t0ryfPjjWVS0DIqEVADFtsFIRrwAju1BqtGB1AVbmb3B
         f6UldPnlHHn4MBpnSH7u2qny6ce3JuCQsJzffzCV8HM2lIG0OwZadox4BQ0KLmRcdWij
         tr6utlISbrGvEEOSK4Dq6od72tA30FxOLJh6wbiqaRPqM56L82LZxexzYRhrREtSDFIj
         Zh1r3M98jufXefo7nuwDrTdumlbvB9QEymzFSNL90nQsBj6FydjR5VjWs2nAi2ycVa3J
         GUOP2GXrBofKx+lUrLk6rtymltltzmW6ErOxEvNoOhNWKx+w0o41JGRy4OwPQLUe3cIc
         X09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        fh=HCOyx9MCTyWX5qczS2MPKWQHqAwXuWjcOZTo7DzouJc=;
        b=NHScEDVOU1KRgXP3EOewUWyrJQTVndvfNG/VLhab0GwoSUqGN0JXQ+V6eItRcjponp
         OudjdmbVNMCVjP3tMvR0Ey6uishSTM/4pgfQ+kp4znR3rhez8QdMPEEpxeswEuiUZp3j
         KbIGQehGXo14S9NNJpALNbhJyroc3ctSR9IoPTuaKryCe/Hp/hurfBq4ysbwRyMHg1Rl
         JahiQtFUAHioPJxD+bo1lfq5ockrP5GIgkzjj7h3lsgeCmozH5RUqAfhhqYU7D5gNzsE
         BRynDzU/jb7ywF7Twk+Na766AKoZmSeGA7KbGrUI+M1NmgRWiK4e6mY4QtmjC5g6d41x
         Z1eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844990; x=1795449790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        b=j5+qfPZWt2MiR9AwyGnuSWff4kqLNf2XZOiwJnxZ+Fv0u1xxF4OIzba8auw2DFGria
         RUb2lc0JvJCxRj6Sp5wd8n8GN+fVHAzINHu4GRUl3yu2yHMI501c4wW2crgydaFx3jsE
         lSM2odqPpPWNXbrGAKXoPpmlZw5EaXH1hh87buKYcgSywRmFBtM4pSnPlvXkBQe4++xh
         0bQTuOm9SoWLQT8EZjRSo/DtXDY558fBXgN3Z+o+1TrHGsvMJ7HiAuWun66rYU1dHnWs
         VXb+7U5JpdSFegGhqgYMC5nLUFcvstgH/6u4ood/1y0JA3IoK1AR6cJ1RlH2vVzkS7hV
         zBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844990; x=1795449790;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        b=X+tc6bCwhZ/5FI79Hh9Vb9Ct/S0PiiaCqitghzMuVSfsvt/B3PbpjI8qItmNxwtptx
         uRXanikE0eUguF3mIpflIUIolulW0viD6/lSFPFVP4dquzaQIYqHDiVhSOYyUmBrfOt+
         bGZ05jIiDupwaKJO4snQmNkN1FYS5L87fl9U4z0esX89QKOc5Eca4Zq/99+nTvDtXXb/
         Rmi1R6Kw3xLzuYpSekrLK5c3UKuaOrfcNeiwpkvHLg+34Oe3TFxnZyEXClHAK1Blz1nX
         /VTJkz0MoZ9m21HZwN2A/SXh5Cis8D2gnxOqMVMkhce2B6lkUPuguHLijGOe42e+IWkq
         Odrg==
X-Forwarded-Encrypted: i=1; AL+hErHMvHBvgOHqJph0GAkZOocqJgx9QZuRu2p7UTcLdN36Uqn4zNO2S6ddu8U64RQmcLX5qDbL0V+C/2qsEw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fjciViGf3wce5bUT5U3crTHkyVmSsRtLwgGVCO5p3LSYJoN/S
	uyU4Rq7G8+s2L6U5P3bC5k8qBO0YroPTKXvn+W/dNFJwHrzZxDwQqa1RpkcmILJjbqOvcd42cOS
	3eLUDVZa+96mewy60X0SfPiQXcu6pRp8=
X-Gm-Gg: AZFdTZctF1mP4PyHGMfZhVMNkb6KR2KsUjPmyP8zxYpPMlES/grTTB2Q8klVCHxNhSo
	mGUv7HIV7Dg19KhJYCke4b4Q3h7VWnjAWRj2w03YprDn3Sl4Jr16yJeCiKaZtaAbDbjgQKz4KLS
	OhE9ssTDezJftlPM5cPlkG5Wgneh6VJuOTpOKVUOphUaNJeOhcwTakMozQJSqBsPeaQabhM1aLE
	FSVPokQDZb4v6gJiI7iezNlnsg60AzTlaiZX/MBgnljjY98yVEcOBarXNzlpT0nv1E+zdFvKXmA
	uJDN/s1aPXJKWRMFaOBgKj6yht8tRVNAI0RYt2AO/hW+r6bYB0ncCps4f52zcglMaOvZHJ4vM/v
	sz92HFXKEWpPA7GEnFwWWKlo31VUP8mmetkQ/sMIqg4qhCejTdlUnFIEbtnhwiLY8zayfadpRp3
	ROBBV3H4nOjYF/TgmWn5q+vlg30Q5QL/UhgI1DpnNJ2WB6cvHKZ6MJqbC7
X-Received: by 2002:a17:903:3c0c:b0:2ef:d952:4a70 with SMTP id
 d9443c01a7336-2efd9524f10mr160655ad.15.1794844989621; Mon, 16 Nov 2026
 08:03:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avsfpHqbu_rdmOrf@sirena.org.uk>
In-Reply-To: <avsfpHqbu_rdmOrf@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 16 Nov 2026 08:02:56 -0800
X-Gm-Features: AclHuK8Zde0ypoKNoy9FjTToivHq-RePvO_-KQS7SMLakIHz2MwjMtcG0NQBgHE
Message-ID: <CAADnVQKjK2ezTcTUfQLACJDBLzhy=aBvoiK7L1cqKmb5RE40CA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf tree with the origin tree
To: Mark Brown <broonie@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Sergei Nizovtsev <snizovtsev@cloudlinux.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 07:22 AM Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> Today's linux-next merge of the bpf tree got a conflict in:
>
>   kernel/bpf/bpf_lsm.c
>
> between commit:
>
>   ea8c4b37b8809 ("bpf: don't mark namespace_init and namespace_free arguments as trusted")
>
> from the origin tree and commit:
>
>   ab86b62012b9e ("bpf, lsm: Mark backing_file_alloc/free LSM hooks as untrusted")
>
> from the bpf tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc kernel/bpf/bpf_lsm.c
> index 468e63dbd922d,f39a3766f2245..0000000000000
> --- a/kernel/bpf/bpf_lsm.c
> +++ b/kernel/bpf/bpf_lsm.c
> @@@ -411,8 -411,8 +411,10 @@@ BTF_ID(func, bpf_lsm_bpf_map_free
>   BTF_ID(func, bpf_lsm_bpf_prog_free)
>   BTF_ID(func, bpf_lsm_file_alloc_security)
>   BTF_ID(func, bpf_lsm_file_free_security)
>  +BTF_ID(func, bpf_lsm_namespace_init)
>  +BTF_ID(func, bpf_lsm_namespace_free)
> + BTF_ID(func, bpf_lsm_backing_file_alloc)
> + BTF_ID(func, bpf_lsm_backing_file_free)
>   #ifdef CONFIG_SECURITY_NETWORK
>   BTF_ID(func, bpf_lsm_sk_alloc_security)
>   BTF_ID(func, bpf_lsm_sk_free_security)

Thanks. The resolution is correct.
