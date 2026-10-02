Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA74F30C3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957468; cv=none; b=q38U/SSTbtojjfvf+nS6LPeSOt7seUg8VLJy619TZPDUb5iFiiFptuAioWz49LdtE66idpkwT+vLZdYiqKLeW6gXKdkp97KzZGHxmAoBsvHHdaJuarP9YgFRVdYl0qlwI/bF31HiJKH2LH/4J8cAy61u7BcM/FP3+h6bN0j6eno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957468; c=relaxed/simple;
	bh=k6EIrKXphmVYtwYT1711/8oYKVo3ADl2w1gIDOT/428=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRe3XOs8rhfPzCdRyNSKsCqYYuBYKzqnTc78MhHxTR33vDC9QwyhobV+RMsRXwUYfe3AKbwhx7srSzBhSnWOenPNxgfEWWSIBVqVE7b+FxrSZHJ59UnZMtNuEuXzbQxMDRXGmg8br80nA9O4ubo/7qY2/zYT/7iyaM+Bj2vl9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SyIpzk7W; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SyIpzk7W"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e2050feb1so11952266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790957463; x=1791562263; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxVPiCTrxqmZkgyyCrGRaSaA/i4Dd2Lh1oLkXXkYEhk=;
        b=SyIpzk7WdLc0zFMHMC++NW7dVImEkeJdrbA61PmSly4Eop1d9PJ7CVnDjCqFybhH/P
         G4otyqCw/1HxspFB6t4/UDyRCSDsTuq/JysYWTPmURsvcHt6a/LEd9/ynB0Xu9APRqdc
         SH4EqdKnORkbSsvSs+pG4Rtlanludd1EqeaWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957463; x=1791562263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HxVPiCTrxqmZkgyyCrGRaSaA/i4Dd2Lh1oLkXXkYEhk=;
        b=n68gJjIxKwa53FRm6Sj6BvmmWHbVimqh3d+LmY8JRCPWaQ/PDMaOA9gwb2uvcWgFS5
         hU/uHsEgZETKUxD6QIsaWsqhkOTvpYSks4zYWEFra/DTd7JeW/CvWCxpA58YrwsMnCPc
         iePJ3jpxvgp3QX+HYevl7un+r74Qzdz/uRcKlOAW7rks9ZpThFStCnPv9L0o3AvAPnXX
         KZzmm9O9EIhAh3OAyeWF9D3NfNPRaIFm59t7EiNEL+VGk/u+issh5LH5pSw/4LoH4LEZ
         CMy5YxIuBv9nBYuf8NRFd0PXY11gJq+A1Tcy5xltwts68z81NIpFROOhmeflygu2cPEg
         omXw==
X-Forwarded-Encrypted: i=1; AKwUvByeOFJRaigjBVcp9IeuFCIqPnp15MtyHAbbJLGXcYcsLRj4ufNwUqfLo3/KtBHx9BfcT1GsK92MlHJjwqY=@vger.kernel.org
X-Gm-Message-State: AFuF++mB9BsjfY2jwrZfTvQsC/biuAh6vVGjCEp/CLM4UDlsbKf1AsiO
	9gGev9qkEbaQw3gklQZ5mci/yFsuQ2eS0/7iEKPUmHTOZHX7na+/h8FWvEY7rNlddnxsVSumiNe
	FRh8qIi4=
X-Gm-Gg: AYBFou0rlnNVSlGtg9x7IeYaVMu7/XPzgrwVoetFTu8q9t/g3DIgr1K2oAW+KMbKqLI
	AD/n7ivUAegYBYTOl7XZ4ClRMi+lu92JrSKRvzkXJ38GdjkcF2KDEDgc2JxR3xBGwn4q6kPj+Xv
	OnebXWIPP/eEwv5iWC0eOscMLXMaLsvDMU6/gmqM+47OnosoE8Q1TnbCiW+hvPAHkAQxWm4a8ay
	SbwqDrzSEjFykB4XR+URnAC2BikiIUmjQVDykBCO12hzbucZrwGRBXsNxYLuCUEXWt82AsJg7Fr
	jrROamXTTayqqRcgSS/x2tDgYhBuVOPJrth73Sa5rDJHgZATyGXX7+f1/YG9yQWvnwigrHG7JXq
	AgGYz04IkfQGgwAarLOE0wA3ISvDtR6HOAJ9v8+VTWeuJUrv+Ne1cSUb2uN+3pzvYwsDVJFpvCR
	9cynx8HQj0/BCpP7w+/csgBDpW9vOYCV5h1yITxg3/0g/PIlaGU3XSy0LCQqfbywgpsY96sH5F5
	pLdE6KJViKb89kJwjwMPQMze70JrFq/IfSGgjsbvsDAi2DXmXUmoMCQ/QJu
X-Received: by 2002:a17:907:3c92:b0:c2e:4342:5f3c with SMTP id a640c23a62f3a-c2e4ad94aaemr253312666b.18.1790957462592;
        Fri, 02 Oct 2026 09:11:02 -0700 (PDT)
Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com. [74.125.228.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa6560sm100777466b.75.2026.10.02.09.11.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:11:02 -0700 (PDT)
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3f641442so11842066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:11:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2D/TSAPzmCJNEsmGhr9BElbivkZK2lDx4twF3HcFWtu6Wu4ZYfe0El5bjbsAkhhK3mrcYQIvnb6FrXE0=@vger.kernel.org
X-Received: by 2002:a17:907:e1d1:10b0:c2e:4e08:19a8 with SMTP id
 a640c23a62f3a-c2e4e081c49mr157712766b.5.1790957461853; Fri, 02 Oct 2026
 09:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar9D-mM-KA9P_pJC@kernel.org>
In-Reply-To: <ar9D-mM-KA9P_pJC@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 Oct 2026 09:10:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeUnds=_XoHpuPt2A0ZefYC4RUvOp0=LfPR2jzQFaeLQ@mail.gmail.com>
X-Gm-Features: AclHuK-xk4Cejur6T8G1Bze0Dr20QtZHSq4M1Cl_MKyKmEbexAadoObtNJQHGiw
Message-ID: <CAHk-=wjeUnds=_XoHpuPt2A0ZefYC4RUvOp0=LfPR2jzQFaeLQ@mail.gmail.com>
Subject: Re: [GIT PULL] TPM DEVICE DRIVER: for-next-tpm-v7.3-rc6
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, David Howells <dhowells@redhat.com>, 
	keyrings@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 22:41, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> Please pull these bug fixes, which have landed after v7.3-rc1.

Jarkko, I've asked you before: please write an explanation for your
pull requests.

"Please pull" is not a reason to pull. The "which landed after
v7.3-rc1" is also not talking about what they do.

The tag contains three lines of text, and none of those lines are in
the least helpful or relevant to the contents of the pull.

It doesn't have to be much. For simple driver fixes it can sometimes
be as trivial as just "Misc trivial fixes". But in this case it
clearly could have been something like "Fix tpm error handling and
buffer size bugs". Merge messages and pull requests  don't need the
_details_ - those are in the individual commits - but they should have
a high-level "what happened" overview.

And this pull request is actively hard to parse. The subject line says
"for-next". So I have to look at an email that is actively *trying* to
make it hard for me to decide whether I should pull and gives me *no*
information at all about what it contains.

Be better. Please.

                LInus
