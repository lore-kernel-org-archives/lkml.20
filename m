Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D53ACA4B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791434120; cv=pass; b=UlfY+ln3AW8xtwWL/sLd3JsCSoXUrjux7SHo5nV7ZjYSlm7PueJ4Vy8FplDUUMZjzSF3n74yzecbOpVauxK6pbBUtDadn7ZA+K8mAqC3J43jjqnw4wu2Ws+lCSgm9NCf/wpr2n+FluJ3EcHGne+4JWEmcIfG6KQzTl/8qzR50m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791434120; c=relaxed/simple;
	bh=XoQi1i/y3vtnJIe6lxGxfp0W8iw9WFV9zz8v6wfy7fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSAPqNU/EmLucz/soDi/ZW/RRhMz54OqsyYVEoM0lK17SS0iHVG9w2KOBtBnr1Mvd3Wo4w2b9fI6P3NGbDxWuxNfFRw3KCZ090xocRsxnyoTJOlZKkrlJbH6p0FrLedXM9AMRaFaViW6neisVjrJvr/KyMy95Hnx6zEAcuhg/MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LkYE6YqR; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LkYE6YqR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3516c82e96cso2007304eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791434118; cv=none;
        d=google.com; s=arc-20260327;
        b=RjGh4kpihXZERKKuR9XkyCTpnurCljUzQYh692XBYgeLt6gm4OYMl5QA+Az/zpKgWv
         m07lE6hhDAHLdQs4FoCeq6fSz93oDlWzQkY8nNFxu8NxTSI3gDCVWV/nlvpXJ3pJNsvq
         YvlZNNyN/iCcgDMUyPPAygoQ6UwplDxrRt3cmNufJNHiiClN5eDJ4ZgJvvMdeDaKZIgy
         LjUoLTdFY/GcXBqcmdZsohveVeg4NRIDXNncChJ2CdOzBcsxnXCFaxzrqhQ1Lb45Jojg
         6iMlHOl1tpY60f9tdYG9eI7UF5H73ugkvqShDVpKTHo8SKJP6i0+VzZED43L6EuUp4Ls
         eCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XoQi1i/y3vtnJIe6lxGxfp0W8iw9WFV9zz8v6wfy7fQ=;
        fh=lyE1EVaOperPg93RpBcMKW4JqGjHdYAdNzH6fzAYAXA=;
        b=nQRbhB51uSzC4k/kHlZF2PMMebDa4zgvyCOrMLk6F2DqmZmAZsaNdvUDMGEhKWu9pP
         wZHXN9k5f4m489bFA9fT+fwv0+DWanVvxvTE/E3V9yvr8bOb+Eh8hTS17svvdtUqG/Hn
         E6yf8iANRj+ur2CnsEKkyuxE1VlaXN8dEFypew5g4Qnu0zJkSCj/u0WhlXkzu96Hme6v
         b8QB06qXFRMfgmetkLHHOSH00tMof36Ef419CtDJ42vxkOYGOv/bwfEAeSeKUdoIrnof
         /TfIWZ9rwb33mWbxqJ/jhcRS8E3zlFbKUIe+8Y11XiP2hztPW8/F+SafGEyC4L8C79Up
         7kbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791434118; x=1792038918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoQi1i/y3vtnJIe6lxGxfp0W8iw9WFV9zz8v6wfy7fQ=;
        b=LkYE6YqRYssGblnpYrCEP9yKmKcb7pNVl8vUqB8SXhElFQpfDl7EMOJo0XuFV31rcS
         ReBwZ8+2rlwhcvx1Of4iXnbvqkDwRT0xszvMg/UjIynF+S0fXPTjhMp1hl8D4IGu7hXh
         gHx6Ki+5EKmJ4jiTNKyL39PFr1vNRo9bzUEE/LfpidYOVjCfv+l+VCO9rOIsxFRPzwaF
         oRSxqR4riHgylJ0VOxvbb4bZV9qkCZ3ofpyiEyJeX3OC4RT8USzZvksH015y71xpcddG
         62rWmoM6tUYguy/i3HPRG5lp6VbvtzpigvWiOcMV8AEqLPxd8k/utmXbSXJyPVsqPVfr
         4iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791434118; x=1792038918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoQi1i/y3vtnJIe6lxGxfp0W8iw9WFV9zz8v6wfy7fQ=;
        b=M16HYnKD0XHrS2JQL487ThkodYoURyUT38XYgIQ2nR3jDLCmAGxNByewWFMBAI+Tx8
         nBd9k5aq8pYf3N7dZbbKdzzhkcsT1sPny3FWd8rLuXxjv2s7GUZYBB0w+NhOC4CWzux9
         Puz/dPjC/yivNslqs6VcZOmRkW6wC0ASes/wJz2f8pS1P5D18SkQfcZ9PZPSQtyJpcbp
         T/FPHFbxA3FwfZyjGVLqabxSyXVhAd1NusfuLCxswDk8QYLsCj8dbsG9aOP90OyyVRt6
         nfe0hC2tOSyPgrSuTaOkA1/LBLS2iMl4Miw71+b+zI1YI7bJkAuW76KXYuVtyr+VWwWu
         Gvfg==
X-Forwarded-Encrypted: i=1; AKwUvBwvZbxIdATEbcDroJf5iX+GvPEgsDv3uB5WWw6mbkZ1H4aWhniIBD8U2itsQ95LgoMobQEnoBECgIogypI=@vger.kernel.org
X-Gm-Message-State: AFuF++nDIC1QrTkPkaDArMOp4GPzU57p1eMNLnvFBpBSfKb/HQRUCa7T
	VYk/246SelDwHAYUhsnIel/hSegfx+qx+IiGPheZg3sGrIe1J++/ExtyJx+Q3ZUMsf/WpsB2Nsh
	4hSB8H692OB/EMJKuwsaDPtqDz2zJuVvZGBL1YW9p
X-Gm-Gg: AYBFou13o7Qhba6Tnj15OuZ+/dkJIjaaoPLnAH0IcG3qXj0XWpSzM+71BplYJi/zi/p
	QSwPEBsSg2quBu/a6cc71CMI+Qk0HYGGCoVat6i5f/cXYMZLlE826c5qm3V6QbiOFQNR00oR6r9
	kpaNXZJ4WPSU4jVxURJohAiV3sjTLWfmk3a9KRedPo+VdZzVbNkmS4QFkJjSPHI0VMytiy/zOZq
	cxHWXfad4m8D+EzfEbCl61Iq6I6kX6rOF3bLw9pNoLBkzDc7NkgP5G855B/dBtFHWVfsALUezwG
	IcQgZ6BL1tyWPT4n7gdYq7vFMhH6FY5eCC9SWyHJLtCWsLsfFTXlfRYzniAG7fdN51pSk3CGObH
	U5EXjcydoqsNMKTnTADGTpmlNEN5BrtVRHaLVfWxcZ9Ci/V1x2E9SCHk2yr2zfNAuRC2McKBMBT
	bBAuT/JulmduDRDLSO0dVsWzaYbnxRC4TPJCM=
X-Received: by 2002:a05:7022:f507:b0:143:5c63:23bb with SMTP id
 a92af1059eb24-16204a7e49amr4513231c88.11.1791434117336; Wed, 07 Oct 2026
 21:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-work-unix-passpidfd-v4-0-350183b6e02a@amutable.com> <20261005-work-unix-passpidfd-v4-2-350183b6e02a@amutable.com>
In-Reply-To: <20261005-work-unix-passpidfd-v4-2-350183b6e02a@amutable.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 7 Oct 2026 21:35:03 -0700
X-Gm-Features: AclHuK_YeTHnG90eRnjnXcfKby1j5D3PmWK-RpBbV20qfOkhK5av9kwUoFmdZto
Message-ID: <CAAVpQUAywU4_xzYUEHb6E3H+mARYE5kLAhQo=uBL76kG5DDraw@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] af_unix: record the pid of the sending thread
To: Andrew Halaney <andrew@amutable.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 8:09=E2=80=AFAM Andrew Halaney <andrew@amutable.com>=
 wrote:
>
> From: Christian Brauner <brauner@kernel.org>
>
> Currently only the struct pid of the thread-group leader is recorded.
> The identity of the actual thread that sent the message or is connected
> to a given socket cannot be retrieved.
>
> Add the plumbing to make it possible to retrieve a pidfd for the sender.
> Nothing uses the thread-specific struct pid yet. No functional changes.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
