Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793618176;
	b=bJO3vpbpDABgcW+/fYyefTOMV7qqKdDrhvgZR5HMwHPLVSKYg6aiYNSYaZkO5lsyRSa5
	 hwLLw51ZMJorKQyvKL1/KLDdup3rgwdRlz5RNiHLqYhBSLT+kl1BtERIjjrYE7xmzs+EG
	 NbxD0LMDO0Y4ilGRQdzDW11A6r+arZkmHweJYAWDJgWgeuBJBbetuaFEH+vv5MtmeX8vU
	 jIivMl7p7UqdIRGk2rizNqTAz1BpJ6fVwB1PnTKOk7tbFoW8rWyEpSgHfClo/YRMdVgJ0
	 prw8W1Kydz70VFwzE7ZGq0s9DB+iF2T8JUCxQdq/sZ/IyX7RrJ/c1CA5izCCSSRYCzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G4cSiLwicJVmHrLeMpkn4zK8J0hU1kTujxDyRkZxuMY=;
	b=RZ5MwJYBmY08PwBxD99bYi4u4WL/N7rf6y1qWaHj2GyiogSJ6maFEUNiizRIxmE9YYV2
	 v2ZoI86uD79LfVMOuPqupQZZEYCSUYzmuF1QjtlnK7G4Llh4uDHnSceBwgSoxDJeU4t2u
	 rMO4RFvHAq/5wUwMSQvZgBLi2Z3rFzTKXsBX+ivPY1f7TpFBef0EdAPwGVGmTjHOMpgjx
	 r0OfKbQbuMAqXHJKhlNvExWEpGlr2HPLpXooWe3fXne5Dv4jYv22IbxZf06ezBo0CPnt+
	 ODORBLJVKOCcvhWyPANZiFQSU3nuqdHzc3U6RBKCddXDRptYsLKOCMhUuGQys9znbJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=LOFmaa+A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5683606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5683606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=LOFmaa+A
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso2169348c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:16:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793618174; cv=none;
        d=google.com; s=arc-20260327;
        b=JU8qD3d0tw8ecQ+oRHPVoOpUcI1NSDhBgK0tWJWTYwPFbaD5jJNwcgw5Jj90UlH3o/
         HZQcfgsGVNsMX82pV9dNyPqzEYJGrWzmkXTgYlDiA93OUbFdh3bYo02n/M3AdEd3ucRw
         8Tb1EVi+XEprLTgxtOkmXAsW95D3TITJhqZcN/1Ma0D3i94bDrbslyJGRjPjhOxrzSqY
         taHVE3Pa9FpZ8R1eNt+WQy2HQkhBeZO4YZaK3H0FxyehM+3aAMfiflno2vFrzM9AprVh
         Odc5c/rfKw9MQpdSP/biVZFN3E2s2Jmshd5k9pIutNuKfBH/vna05P7o4hUflvlgsKr4
         HfLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G4cSiLwicJVmHrLeMpkn4zK8J0hU1kTujxDyRkZxuMY=;
        fh=MpYlg91NZd+LSw3d0O5FzPDMdqtbITDbkGdnco4xwzY=;
        b=VyB0QvY5BS3JL1XewLqDXpzk+7DkL+YBOj2ujxOzcJEftWwTaZv/fbQ5t2AjUhsv5X
         AB/IzX5HbLLx+X55LoB0yQMo1XKbBSCHtZOb7kRxVcViBcZt0acR8cQORY9kvHyAenRb
         EsNlntSnu1cmdFgBE8MRkJeqIqvTELgiCRHtJZHDGCJdr9GQppv9IyEYbXEnwGKXZzEi
         mv+vRoWmWx12/HzqMz9BWDu9Tas+chxec3JdaKO/xecp3RYFVG5+Sv2I9hzdL0BPMEeL
         aDb0Q4XEosh43+Q4n9Z2IaCcdgYce1WuluaBK65yTp4uwN58c2wLOwS7XmVfixxL42Hm
         sk9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1793618174; x=1794222974; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4cSiLwicJVmHrLeMpkn4zK8J0hU1kTujxDyRkZxuMY=;
        b=LOFmaa+Am17SrsOWZACAb0ay2UBOgyLboNMlmS0WrslonGmwLB6mmGf9+a9F2uYRBp
         t1oGQX4TvYHqqr539NBgu/vWo/t38y7cm2LX28LUKYux0HkRPhHmlHFKvNZZaxP5LbJ/
         aXg3cwGfZ729b9kOu7II14xn/TeXMYRP0udag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618174; x=1794222974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G4cSiLwicJVmHrLeMpkn4zK8J0hU1kTujxDyRkZxuMY=;
        b=1XUVVOoq7HvZ6VdG+WkdxcJ8pvhzZqlVMNu33XFhUNPEywhN7CgcKoKBQW3MUfApZd
         yZV1X1Hh6AdF7sq2Twaxnytb0wBxBDmvPMSuNf5eBSVpYhlsl4jDKO2x7cFSO4FhSJrD
         Tv5zGNXm0a5wJlzhzW+afmsEMu4dwbpkUD+/TKbBxBIh1Gm2i0bruYgX/nNf6UA+F7hL
         KmliZqnD8t3UOGgOwwl/Di0mF58DLZUPWeKgT4kjLmePTseVsDEFljSnl3rjf88EbVjF
         RogOBIkiRJvveIcVM18KnPnFWPKUaX1etvr5mbioov/Kkchw/yzOuW9uFKsS+hi4R9Hk
         gIlw==
X-Forwarded-Encrypted: i=1; AKwUvBw+M6SMZFo/+Tj4fjBwIgekE1HnGfqJuXMf/as5epXkGT2LAGw6wCZB28RjzeZ6xZWqaHLa1jDjnicM/8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGHnx4qrCgs/xWXn2s/tbDZQkNEJhU2OtjPg15wYIbmuto97oO
	eNRQxL7NiC4WJmFakCNNWTc0FEipWqoqziy2e1yf31cykjB7uuXVIksuK7FBfNuJgM4+ew4xcBc
	Bm5Pr3S9FFz0jn9jmnxr/itqDCcyzb0Z79KXkggxPaA==
X-Gm-Gg: AYBFou3P48nm8DLMhLqHKMzms6CECJB5sFHf01JUTR09Ut0ef4+IiN1SZjN+Bg4Tgod
	fT7FrCsw6f6kaLosd+Hh0dXvhRXLDLbxohV4UTsWryKYWAj5prdUpPbYDrjRYa10hmqAfqJDz4n
	svLidEDy27sbEde96SedLycQpPa1Eg0kSNozHZlCytuBhNumDjcoPGmmJSpQc7HKrK5CI0tWVUb
	lHtOOaFJLeTAd8LI3EEZGN1vjSqvRIMhIkxPKoStb0jTmWf+YpPWTAmLmpLSANsv7RJX0tCAgIT
	2B8i2UzSq8lOoxRX4d98yLy/e5oagDP1i+FId304Z8xyBNmcXOGUmpuyqmF7y0eyTPe/7AjQMqY
	gazGu6aMijejRlt7YAzFEy6RBnFHLfz5shVZk+t0=
X-Received: by 2002:a05:7022:b903:b0:17a:a3d4:8b17 with SMTP id
 a92af1059eb24-1ac5ac4f0aemr12405133c88.12.1793618173694; Mon, 02 Nov 2026
 03:16:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025034410.808796-1-daniel@0x0f.com> <20261025034410.808796-2-daniel@0x0f.com>
 <auhrgteGO3TwU3HD@ryzen>
In-Reply-To: <auhrgteGO3TwU3HD@ryzen>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 2 Nov 2026 20:16:00 +0900
X-Gm-Features: AclHuK_yExg3ifaj_wGpLVEITnJd8FTrPLgBisUUJnC1vT5nQFSQxKqD4ZAFeAM
Message-ID: <CAFr9PXmU3noRcZ=nvm0UsU74gMvNcneXdksOGJ-AGsZ8xaVMog@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ata: pata_artop: read the ATP865 mode register
 through pci_iomap
To: Niklas Cassel <cassel@kernel.org>
Cc: ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	dlemoal@kernel.org, linux-sh@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Florian Fuchs <fuchsfl@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Niklas,

On Mon, 2 Nov 2026 at 19:52, Niklas Cassel <cassel@kernel.org> wrote:
> Since your cover letter says that this fixes a regression,
> I think we should add a Fixes-tag.

From what I can tell it's had the inb() from the start and at some
point that inb() started crashing sh and maybe other places.

Maybe:
Fixes: 669a5db411d8 ("[libata] Add a bunch of PATA drivers.")

But this is all the way back in 2.6. I would hope anyone using this
with an LTS kernel would have noticed by now :).

Cheers,

Daniel
