Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC83D669A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852340; cv=pass; b=YH3zzQuHw2mNFDiwPb3YXagL9uF3P+Sv9gDnCrZlfoIdd54puVknb2OSM8v0uuImQAMTC42/1akLA0mM07F+bCvwwZ+sHsHKG06DZB2ChbT9QmRQYte2oQpTEAaFm7Ex+52LJWGhBqgGZ8Jh+/Ujwn8rtxyT2wPnav95+bGL1NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852340; c=relaxed/simple;
	bh=KbGEgPnk7vZYR+vl7/TWwf7XdN4fpXM/jHOacnKAOBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKFpomoFQOwXEGfItAEyETI7KYmgdWysgWRQ52FyPeinHyCz3GmE8Iu0ptzwjhdDbxB/jcco3UjH2HIVNGMNZXD4q1lKN7rxw0TfcI+FxW0cPOEu0V17cggSGwJgku0HqRmZQTx265ZbJ7XSWvppebjiei0HfN1NTzmu1XeoF8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEcqxHOi; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEcqxHOi"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0b486d91so309638866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852337; cv=none;
        d=google.com; s=arc-20260327;
        b=Co3McB1Dv/lQr2KgxzQv4wSQjnUClC8zP5TMk5rQWVaLAFiVRKPeba38vtotZBtjyO
         SDMyId8q77UMMqLdsnm2WdTd7pGlvOSAz716gWp8cDhyqi+jl8rKSqZo+pZKU7CKEGGr
         lRJwXDkuzM2hgkxjKjmo4pG6l+0R3q6qF7W3NtTIIS95v4CFO7vCvsXanAcPHsA+zbNw
         YhEjxkLfFrbraW+HvxQc8j80QZ4xOaZrK4m1NC888lCJgeDVjQdLzfSM60pNg1PJTcER
         u44S0wRp+WVoxPBJtc8W6xm76bml31mePzSTAu2u2T5MbZKQYKOGJW103SswlnQpDjZ6
         6LMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KbGEgPnk7vZYR+vl7/TWwf7XdN4fpXM/jHOacnKAOBk=;
        fh=4aKEzR2lodSJcmGj8K4aIh1iw4Q3IRguk0ekgTZsfWk=;
        b=FZ7P/AibinnwdqceI+VHg8stq0Jo6dLbJwJCFXClSJpTZMx8GOx9L2gNHmR1v+MF7A
         ynSQ8BGqH8snKdsF+gdjn0cAClElDOnfCaU45ZHOZMiwY7d0AM/zzlvq5vnRVDRRb7LM
         sGwhK/9fXGUoSqk6eWxxBUgHWiVVEWVr36hk/y4V1gOBlu876cngvcay+4TaQq17UdJO
         CQJ8KFvZvAxu8/MPnjj9HeDQmsU5/hx0uOy4aLJzv9eHjiJfjR1s4qtFkL+ZKIxdYqes
         2h2kksaQSNqoEsHPLHro+ifebp1ofkXBi00CLfZbj8KZ4TZF7WaNygCZ53Mc920hMw5v
         8e0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790852337; x=1791457137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KbGEgPnk7vZYR+vl7/TWwf7XdN4fpXM/jHOacnKAOBk=;
        b=hEcqxHOiuingEmH8/Sf/LuhYLAdSqW8jSge6P68ARYPY5iL3ADWBzchaRBG93lZvaj
         4fdOlibMDsAe9ZKN9OG18GGIN85g3fNTCE5WVdCBQx0pXZmHdXhddIkOokX/lgMoSEQI
         ul4DMM9QQJiVjGS5L9WnDMx2S78He83pFkxl3+4R/IvT611WmQyC7rZS6dzH4KpUea73
         Jzdp2o16kH3w1+n5+wN8yDAI4TwTuiCzCTtbk+gfC3YcFF7PuLHCmUlcMXb/yM57a2Er
         q1NUkkIHvCWB2Df2CQtU+emKmewyLjnCiqe3SRW87tKLvl4rhDxGcttJKne5naFWrnnn
         GLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852337; x=1791457137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbGEgPnk7vZYR+vl7/TWwf7XdN4fpXM/jHOacnKAOBk=;
        b=mUDMEdXz9waiNQY1lFduPVQ5K+vLo0FcXCedK8wmeXWUburqbLWonK5s9zERIwPj0B
         I2CVmZXSBn0mi+ikKCyEPtleE5GYtp3KqoWwRfHciKc8ZcqAQvK6HPBg9a7o3HZDiwPg
         PBrQ5RsTAE4sEDRb/OScJpi72Tz2Ak5bJ3Hzadp3gf9G80hMZCv/HzRzB0xjym6A9Fpd
         8kC8XQLg0+hOGcViDDuUksdKiXM5pCudCJk5c0YerVHxNsoVeAGjjECxsi+G62ezFsCa
         9Sh2/vhBpBiEPbWEiGuGW/LE//FS7D/ln+lwg9wff9+0w4dyQa8bwT5WEQyYtIxaRteb
         kn7A==
X-Forwarded-Encrypted: i=1; AKwUvBxdlyny+pjIXGkkzQfp5FIpivGx5l5jP6muhSoC8dxqqaAMt+F3pOzEk74NLbpzCHZ3IMd687RrFUSvyu4=@vger.kernel.org
X-Gm-Message-State: AFuF++lA2Mddm0yB/9td4IMtX31cQJ2pke/a/A9vtool7fttjHQA0p72
	bOdhmG22zyBLuIN++5QunYmnahOltyk/k0bckgIAsyibaQvbRJO5LTtGSGfqeklIrTnp0NyEgOi
	3Cu0WYffEP87x149fwTN4jizBqI3d/MxCFvsu
X-Gm-Gg: AYBFou0LPKQS9ioiD+WQQ8k5UotcCEvQQF7YefGIm6fNfMhu41EXxhqMqa22EU2CYIs
	998LLmGR3XbXlMKiXpEJH+ZpyPUCoViCGdG6dmvbWX9ugfEVdg5aCnBzo3DPKJK5dkgluU0DuK2
	Awao/RgByqzPmA4BD8yEy4gES6jRm69S75zuy5apOJMoZG6Pj9cmkEMjVHQvH9ZxwYpqlx3irvv
	s2kQeCSJYCm18pNwLNUZCE+/2XSitzgopR1qKyPGJvR7Jq/KeWANFzkEfCzmJgZYATDdB2cz7va
	ZI589wNCi2Xo7QOv0l9WPcvQHXrsRIh0XwxhVc5wRmP9Wzsal8ag16QVZ/sOBR93n5Bx8c8T6Nh
	UYLCmmIhxGXRht9DGfMKLsAT0
X-Received: by 2002:a17:907:9688:b0:c29:5151:16b8 with SMTP id
 a640c23a62f3a-c2e23763c99mr352304566b.2.1790852337129; Thu, 01 Oct 2026
 03:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918090010.1688-1-aditya.ansh182@gmail.com>
 <20260918090010.1688-2-aditya.ansh182@gmail.com> <CADUfDZorK-i+eOEpGkVFf_vJhqLUKfBX9n_rkiWtbcyoMHT8uw@mail.gmail.com>
In-Reply-To: <CADUfDZorK-i+eOEpGkVFf_vJhqLUKfBX9n_rkiWtbcyoMHT8uw@mail.gmail.com>
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Date: Thu, 1 Oct 2026 16:28:41 +0530
X-Gm-Features: AclHuK-FOgD42JgsxASW5ZRNJ_Uwb8ZfRxtR396n_NYyi1ZD5u7-WI5DU3g3XwE
Message-ID: <CAK5ssPOAZ=PGDMjsihKCx87Gw+UBpc0J=NB+pOo8PbSBdzSpgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] tools: sync io_uring.h UAPI header
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>, 
	Gabriel Krisman Bertazi <krisman@suse.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:20=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> Can you drop the tab character and just use a space between the words?
>
> Best,
> Caleb
>
Thanks Caleb, will fix that to use a single space in the next revision.

Hi Jens, Gabriel,

If there are no other comments or concerns with the patch series, I
can send v5 with Caleb's formatting fix addressed. If there are further
changes needed, I can pick them up in v5 along with Caleb's space
suggestion.

Thanks,
Aditya
