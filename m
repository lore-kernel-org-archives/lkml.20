Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22326348C54
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562791; cv=pass; b=HJ8vYWXIR34t/jq+voo0rgcOIwxEvCEXcqmpM4pREURQJRAPhU5iMXZvm6kam3aZ1e6dtmnT8SAdTdSieeIrWxjP+NDasw+9ljLD9x8EveWGit7w1U8BdAtv0SRDPpfQGxUc/k684hjACA0WmxCcqtOJesDny03sQOIw6bnMLss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562791; c=relaxed/simple;
	bh=YWHIeJ0I1v0espp3H0KecDUrdwjo8I0plqipObYtH44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pP8d1FWhzUP1lxEeDqz7meM5wQloRYJ3URSRi5Ve8oHMbWmiG313jNfPGg22zQLOS3AXh8goFWuF63LCtWY7V9apX2vUW1pN7Kg+5a0fE5bCzL0enMe9O9hoRXbYfv3kRq5cSqbQd7DRVxIY+WfnxNofaM/NltYHoNigQMhM1f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rN3GT4eR; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rN3GT4eR"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so898119e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789562788; cv=none;
        d=google.com; s=arc-20260327;
        b=Lnzvlw+AObYgNvlbDaGY35KTG94vN6KLorbYchegOW+hOiHeoNf1LOOf6qKaJkXOKY
         eqF2vYDXjyZAIpVSoCMT3puTprj+wVZkBw5naB1MmuXYIk1dwCquZjyBo6ERm9u9lvKe
         ioGL36/RoCngcM4NeNP6sVG/Ldl0FolR79gQBi2bWP+PF8KzZ7KtqDXlk8TKdbOBV+yN
         rvGbWYHtG1VqdgevpaCREb7IksPCrlrHzhGjfY36cNpXSRRxEiWDAD/6t2ZmUwjcoMZR
         6MaMZ61S3ZIYGLjZS3CasAu2hOubUtGwPR5wb9cRhDJnLTCODAgLk0kvCq2/rJ1sNDsn
         A9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YWHIeJ0I1v0espp3H0KecDUrdwjo8I0plqipObYtH44=;
        fh=fvkNtOSN2VYVi+HQC8UtS7THDHJP+fOPFOQn8CKutxc=;
        b=MhTeESIS2JqHJ0eWkQicDMv69r2LwWqEcQscqeWyKtP6rzPyUSQA4lyKLg9MaXywjF
         ko5W76GZsueJ8Fnm0kdP2qSlpBiYDZTC8j8tI0a5hLBpwmejk8nlVZTZaKv+zU5igHYS
         7KrTZK5ILgsBFfpSiWUC0bf1ZZ8NfHwmaVJF3SllS4a8MkPszn2zOYbQXt9rZCzBLVd4
         /LM86aCFdrONx7jK7Y0fJsFJ7d/S7G1JnC+0BAnr9J23XbMcrGic1Fzbp8quYNHllE13
         Nbz9KOLysjgasuwpaJTyesz7uewrHti5KPcWhjcfy/Lf5+AxnFJ19EG8e2my75iJ0TM7
         KQxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789562788; x=1790167588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWHIeJ0I1v0espp3H0KecDUrdwjo8I0plqipObYtH44=;
        b=rN3GT4eRL06IuNrj4EaFL/IlpwjWkodUnTh90KnNrnPumMIzi+j+5OqyS7Xzg5TdmB
         PKZbFnIY0krPkfr6HYm4fFN2kEMNc0GmJFCehqO6NJYPmIC2JGx20IgbEM05IDUWGHUe
         jFYhzmgLnNtcCGIEFNC0WSGLXCe3a/DQA/LYZhf26gsmyUeZD6xMNHJM62kP9Paf3XBl
         tTtj2BataGk0FvdByhtBNArNDHwEJX/0NmA9adkVdw9aJDTP1XSdewMdYyhqYmHMvHjZ
         inYrk8RKW5SbBTvYLkyBFxnO3ERcMoQWvc1WIpARsffic4fsJA8aZsECVMLDT+Vdp6GM
         PzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562788; x=1790167588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWHIeJ0I1v0espp3H0KecDUrdwjo8I0plqipObYtH44=;
        b=oMMX6ZGhFH4W30EqkFFEBhgVEltSffTdl+94qldZM8Z5cWD+vFwD0li14cm/23rE2R
         5JE4Mv5d4hJLYeNofeLZmwVqZX2NmePfs43ulfPIiswZd7BdgrFgt/tGUZL+ZPM1Qo40
         98j/N777fEGkTTw8lzdkD2iuqJQr10U6gbzdFrXB0njXJFbR5LXoBltLcEVqrdLsdnqy
         CBqVjXOMUPU9j6XyyI4zffyj8UOFRDDDERAWyF8S3YFysP20xJOS5715ZayCYA2GRqM0
         7b6QaIuEaByzW7Ay3gg4IqRAT666BM1353X3WlJfL1hmEsMmD9kV7Rp8SpN9ZBfvVU40
         RoZg==
X-Forwarded-Encrypted: i=1; AKwUvBxEmAwzf+d3mGi2+YAu0eZ0Qz+AcYg6PxKN51G4LlaXix2okoQQPc3HuSsQUsbXnu6tjvBLaOuRTwa3/as=@vger.kernel.org
X-Gm-Message-State: AFuF++k4q643Qe0kYs3WLxrGQK5rEVIUZkTr22NgBihH8HeN2tSxRE/i
	ossDbRBgsfRV3ATr6uDflHA3GmrVsmsQkbxYLQ59B5wiQ/gfrFggCyL4Nq//BprGsqxH8pH1q3n
	mDWwitPQqy0sS/OeYgmhsABo9XQxA5iw=
X-Gm-Gg: AYBFou2GXPeU65hMh35iq7Sw0SucxCE0B0oCEjj+F8hTgMREtalVz+adUJE3E5WwGSn
	Xfsef+G/liF5kSJjIKyJ6ui52jZYPbiIfIhiog4oZ6vCwLpEolLJOu87VTpwsi3gyoStQW4W+oB
	d3yzJEsF+JBz8stBvWd2yddBYZtksj8M9m8KpR1zFEOrg/kS3QmRYJgFlRhywHaWWT1g3fiIhCE
	dhO/gJB8D3M8mB3bfUgSY9Dkoqyy0c1jatg3LXgC2ZGx8yPI9v7nMuASQZGdkE4DijjRkkewsg+
	h/xrt8L+Ntq3yAv6TROdKowV0RW4EzJiCo2vof5XDmChae2iHEiNDu9BDhcv1xw2up1IkiCV18c
	MZ+0Gid8+ETwMDgCPDgkBA9KvTYISVpchKTWK7ghs5zb8jF+Kiu9wMGTIdpQ97N2kDLlJ
X-Received: by 2002:a05:6512:ad1:b0:5b0:23b4:be97 with SMTP id
 2adb3069b0e04-5b8b660a9femr1322851e87.6.1789562787731; Wed, 16 Sep 2026
 05:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-ptbr-stable-api-nonsense-v4-1-0ef5e58504cc@gmail.com>
In-Reply-To: <20260831-ptbr-stable-api-nonsense-v4-1-0ef5e58504cc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 16 Sep 2026 09:46:13 -0300
X-Gm-Features: AcwNN1W_zJHxuzAnaqcw-sN6wvhG5SctbHt1TF2qFBrLs2Cvll_dgxM-Y9xAZzU
Message-ID: <CAMAsx6dyL3o6LsG_VAhKi6DKS5LTPXHMFnBaS6QhA_zYCOROJQ@mail.gmail.com>
Subject: Re: [PATCH v4] docs: translations: pt_BR: translate stable-api-nonsense.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 31 de ago. de 2026 =C3=A0s 20:26, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate Documentation/process/stable-api-nonsense.rst into Brazilian
> Portuguese.
>
> Assisted-by: ChatGPT:GPT-5.5
> Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>

I'm fine with the change itself, but a note on the tag again:
coding-assistants.rst (line 48) asks for the literal word "LLM" rather
than the model name, so this would be just "Assisted-by: LLM".
