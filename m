Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD650B8CB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699500; cv=none; b=Q/uG2RtTFctQcjK16hfN3OymJ9PgsKtGK1CXp2gdB/CS4XxvoUkMIuW2rBNBHbC38JymcDYc9j09K41G/6VGuzZnaU4op2j0I0rm3LQoEpUYaCtnREgfZ7iJJHuEj8NL7hOrVCieopSRyPOg5Uk477bSCbMTYilQRH3hSYe0k1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699500; c=relaxed/simple;
	bh=lnpKMnLuqv+oX44Oz2gq1nLSEgp1cliwREafqFlWmDY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YQ4Wxp5ETdAou1Mh7DrPP4RJ4H56FrxOl7CnGSSI697JJQYAlComTSgOvFlq7VBQ7OcteNRLzVmjVOWHCNXTZbDYRijgJjCCKuVdl6e0ncbyeyboQEh9DjK9f2UjaBUU2d1HD7cpbqi4VzQ0/G36FuwBuRLg1xBTdwNik/5cUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXLZnBkh; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXLZnBkh"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d27b7410so101854a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699499; x=1791304299; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vWBRVFg3TNII9e3JzDYA1qiuNTLpJveN/yke9DPuJTk=;
        b=WXLZnBkhaQdF/n4yC0ECg3VUQDF1tfB5yHqnqXisqAp9F9pakdePCmKAKHtu4mZ3C2
         5h7bRYuW4CKnad0F6ikmUcR7KhJECVan+A4XYV9UIm5yacC94ktORqUpxiTu85MNUbw6
         1Zte8PAEukPCRYONDX3xeeZZVLSnhoKgEZy4zgl/7RAG64hMciGhHjZmCmn63j+e6q+e
         jAGLTztlNpk2eHGxEhzoiMRHr4N5ZjxGrMVoVZHGRbtKyuwVTr48tfRk4RMwavxJXYI/
         /K2C3CzsFVsSqE1nr7BqgZ0nw3YG0jIGSWml4hDAYj6mbslFeGojuj9f4tmkBu7bxRrh
         JGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699499; x=1791304299;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWBRVFg3TNII9e3JzDYA1qiuNTLpJveN/yke9DPuJTk=;
        b=i4M/rA40sJYLk3TK67IVMBdJVGckyvuhD0mcFsY9dFgOpNbcwCtmvfGiqDDOK4qh/s
         uxS55nvqZk3r5nSa7lgms5413IpHu6GkJspZwXLOL1gJJudUQVsK4dW1ZddSvHsi0u2Y
         J8e+z1Xt3jjbsKyRMDnbK4EY7Kl9YRv4GxeuH/kF147zLkVbsdKNmfvXwnRHiN3RtgnT
         aPU7hJgZBqRbWKfSlmNVvQqQvwtszEkaSwQGE/gMI67JisBFFITnDWb/fY3XW5rmdp4/
         6poHpturFMA3J8ivkgn9m3yFBUbHH1+XPgnXRG4PmVzBilkYNzu2ZSjqE1HLoWqhpai/
         Ol2w==
X-Forwarded-Encrypted: i=1; AKwUvBzU4KS8MPWydLJYl17I8JIyOL3Fssu2tHuajKqPeKrI0muI65EpwSkZLdPAaEAt1D1yJ4/0lFOhUPVQuRc=@vger.kernel.org
X-Gm-Message-State: AFuF++liCCCWpfXd5CoYMwZSxrdOt7JvlHWfoNQI5wNUdLQL5rfnYZV6
	QIz/0TopnLzkiUKdxkh7HcqCivzNh1QALoU5IpSqUIY6r/7Z+bZtaGtg
X-Gm-Gg: AYBFou3Ieh/OL9f4ZXb0W17AQ/yMZa8SN11Tx4Bg6OaZXuR4emgNzfHPl14J1z/Mq3a
	cqyxPqFmd3CE6gcj89TLM/RgaYxDFxIZQirbiyq0fCfdCE0kZqFsiCxwUKpeca0L+OzDHlONt+7
	Y16WOxR8U7tPGJaDHLYT3KFeJNDOa10Mtc9mtsCJw50YElT1U3WSYBk1XWqfk0/75lhESX9OI9k
	JsB2og4w2GF6PqM+W0ed0t+OwX/QRNPqdXld8YWEwTTEfwO1js/UBkxGFdZWBV8Bbe2yUlJ+8iF
	s8mjbHPhfrmmMiWKJIPwyMpzp+zrzZz8pMp1oRkyIuxgGyKjBosO0ejvEtcR1qhUAXlfe03aZCd
	DJDIDZQpDsEdxveCDLh/+19drgqsG/vd87ikV3+tXlAXw5w6gzr0L4mZYwmxLiwxB/y68cz/iHs
	vJatOIRDO+T2EUhqeUeSLzu/s2+KwqhGFbOf4iANd9K6mKUQMKQpvOScxMzni0uWpi70Y1z8AnF
	3PBI0kX8q6nn7Gli2cJmNvdR/bGb55S+IQqGgF9oBqk6jnP9+AGEpC/EWVCQrmKqf/UtuPEaorz
	RHVN
X-Received: by 2002:a05:6a20:9e4c:b0:3dd:a007:cb2a with SMTP id adf61e73a8af0-3de26db5242mr11967568637.38.1790699498710;
        Tue, 29 Sep 2026 09:31:38 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7d2b562d8sm109617a12.24.2026.09.29.09.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 16:31:37 +0000
Message-Id: <DLRXZSBSYJ2K.3UN9IME1MKDD9@gmail.com>
Cc: "Florent Revest" <florent.revest@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <arvRs4KdojDnW1O6@sirena.org.uk>
In-Reply-To: <arvRs4KdojDnW1O6@sirena.org.uk>

On Tue Sep 29, 2026 at 2:56 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   arch/x86/net/bpf_jit_comp.c
>
> between commit:
>
>   17637e1a581a2 ("bpf: Skip detached progs in trampoline images that are =
still in use")
>
> from the bpf tree and commit:
>
>   29fcf9ce4bbdf ("bpf, x86: Use global buffer for trampoline size generat=
ion")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

all correct. It will get fixed when bpf gets cross mereged into bpf-next.
Likely on Thu or Fri this week.
