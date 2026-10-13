Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B051DA0E1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895470; cv=pass; b=YWDFIIbWLqE1KCb6wSjszs+pNh9GbLj+21nvHXFBxtgsglAyY3kmYm7HtQjNbuYRGegzk6Jxivgs8Dm/jLhcEu5tpMuAROJF9hM/X5JbLR9Kbah5NgcRgbl87AV11OFMFxuTeUu/JZ6bCI92TZvfX2jDtQu/w+yvWi4EkvQX5gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895470; c=relaxed/simple;
	bh=kkCg+gaCabuK60oXkcXkFbigpaP3hK8YeCB+Qci9cLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7j6+We9Obgw5QZ17E8FBXX5r2GBfijbGuR7OIraT8G9ju/Ssj+peQIX24EipxhZusCjd2JjE7K4ch/IOUE98JgQotwbtY2SJVs0umCXUVoiSVO0WAOcnz2O6MCmN1ew+97tGj99m3NBQE5fU9D38T8Gd98mjdPFS5Ufe+/fEM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdQigEBV; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdQigEBV"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-150b2fbd784so139998c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895469; cv=none;
        d=google.com; s=arc-20260327;
        b=OI2MVn8glvpvwsGuX5/7jbpmv4X+NR2jTSi5rDFlsMovHrd44b7pnH7PcZHDWT22+U
         a6l7LLaywNOtqiyjs0k3YxTzGnMKd7ZlRYW3j6IevJp2QXd1zhOfftslDhDfUghXhF+N
         PuCDepELga37wcx+Fo98pa4Sot8fxtgiHjqyzfCBjmOVrYESXQHmuEVp1+I28d3m8qHR
         mewABZWT4tWN+uG1sL0IsHyd7djsX0eMaoea6VbNeU0BPPjUClDTA5NBPBGcd1KP7oxX
         MXCId5gJz4ct0xPzbuU9X/3iTIgCQrMTULaC0cEvN+sKSCMBFlWi03+sStI1u+gB92Si
         x3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kkCg+gaCabuK60oXkcXkFbigpaP3hK8YeCB+Qci9cLc=;
        fh=mpW4983a4GPGrGuBpBzvP2mGsm/lbL1XTuqFjwuffik=;
        b=pihjoCyOYamR/wrK2tfC/sqYKaq5cj1JrbDxVTGZUmQvPJXvgwE/4Dexc9x/iiCHMX
         o3syp26cBc4kB53vVZh9g9qL3seVQ750RvwtSJvTFz2CALktA1h1Ja4v40bZIRMmEqR4
         JqpYbP3pzcM0f1cZS7wMXcGOz7cYEZbwmlmHF2yE4rhyawx0xYTfJoU2ZHHlxwYjELlq
         tV0hm4BD2DYuognFYlfGwG7myaEiRZhHrUi14bKJeFTck2KSWVhWCOLoPmM5TvTxQcYd
         qIXOP0BTnSZPbVhT+PpY3rl823ZyLstSjIhnrkANZUsJzcZ9Ed2mssIp8Xenqw9jdqXd
         UtCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895469; x=1792500269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkCg+gaCabuK60oXkcXkFbigpaP3hK8YeCB+Qci9cLc=;
        b=SdQigEBVG3gsnV20LSBx7Dt4PpvJmaCtdTCwIjyXjyJEpUekMLib6yx4Zs+sQfkGAW
         tJtttOq375cZ7Cv1yRvcHyCUFqOkxNIXVp5cGy4eBc1RSG5+PumUK5+o293xEmg/xcSo
         iucF2PSamQQmufr3vavzZVzsM28i+O5YzKaUJAJmtQasJ7Cwtv6yQGpB65rZTiiH8wXd
         6+zTGWzxaqt/2GtFcZm2gAjZw3QM82J4//zkkhm90ZlpcMFVo9xxhzGx8Y2ExO2Hf/c1
         i3ssJajiFwD49uwi6McCX0Hr/A6Cmopo4qJLPK86YZVwMtj3M8VSX1BTswNbVd3gYxq6
         BxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895469; x=1792500269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkCg+gaCabuK60oXkcXkFbigpaP3hK8YeCB+Qci9cLc=;
        b=CEhNVKe+GS7JMR7TT1doCHKa0fl10S1quLZnKRUWyc76D89QvfoCgLKi3zz/kkd8gr
         kxGU1hOAOoHKGVPPM+O/jSJU0bYgJURCDy2aumdwfYF1zbWx6OeiXXFaiPugI9L96RAG
         GcNnVKjYnIwBv9JPswiaQGpCWoqCACO4zmYENh4aoWCYSe+yG4LRHOMNq4maP6cND/xb
         97ZYC0s0hQuNuZTFeTgiBc7vAneUjmOawPIYTfwyk2A1xWD631YD+Xc/DMN1FHDgKxiW
         mZng6f6N+kkWnwnSZ/YObZezGUeX1gm02OGcyB68i3SxF3/w7ScX775Yly5rBO57LA7D
         GMPg==
X-Forwarded-Encrypted: i=1; AKwUvBxk9nIKYpAaG79TCEVco/wY2Dmna5vLCPHoc7bjbHeX0sRWxStxHLT+c/Z22JusqrnlBr7WLimGQWh7shc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTmFQgstUd3jE2mMOCbLjfxaQQhOmIuYJgiDDRTPg6956mqAbC
	mceu4/G8RaiddH6Pn2ZmcjE1WMAZfIMeNh3lvMM2eb+rWuV3W7/gmj2oWCMzeTd/iA+kAatAy5k
	xR+72eQ8S1WHx7iU0rVY9YUOxKnKQfYA=
X-Gm-Gg: AYBFou1E9ALaA4viZFc2xSa3QMIlUtAPWW3otX3sx39K/9/SSSRIwVLdzucTjl5+zaf
	BKFg/BJ2x5gMw/ZJUvMzM414E95WwkN7KHHZop4Pr2mmIzv1kcQrvI8EqK5u3rSNdxrrLzCCFGX
	Jlaphfwyr33wOTFqqDQAf6vq/TE9qQjtwXcmzOIwM21xQXEd9aYoptYgoCch7V/Syk0hFb0AFQ6
	iRJF069ZvhDrh7PZbJ9VrulGd59pKD/U0ebmc0gs34Z9uVSkCLQRVR723LUkrpaIpBZKR1OoNRG
	HsYOR35Bp4QAyLFNoDE8TkEybGy+EKFw5g9qJc2HQHy6mkutKmePoj/87XEPehzwgwpF7+A/R3y
	hieVMhjsZje2eFaDXTxtlDK3bN6sE/C8XmZOnmVbR4i4Ue9RSjlMGrFeX8khMiD+MaiIYyga9SD
	6uOnpIkCVqR8AyK2Vg8Olf3N8Q07hbg9KY18d1ICY42qc77fit0fbX70kmq73i8Q==
X-Received: by 2002:a05:701b:4515:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-16a4e2f6033mr25321390c88.0.1791895468496; Tue, 13 Oct 2026
 05:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
 <20261013-binder-consolidate-txn-prints-v2-1-cf78927dab23@google.com>
In-Reply-To: <20261013-binder-consolidate-txn-prints-v2-1-cf78927dab23@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 14:44:13 +0200
X-Gm-Features: AclHuK9BCT2j2yMCpeZmg1z4Lfq84BK59tzr4n_wHbwb_FqttuaC0SVmRy_niRs
Message-ID: <CANiq72mfVY7a9+GyHsO_MWXiXhjS-Nj7ki54HJrMCqnQ-RgOmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: error: implement ZeroableOption for Error
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:38=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Rust Binder wants to store an Option<Error> in TransactionInfo, which
> derives Zeroable. Implement ZeroableOption for Error so that
> Option<Error> implements Zeroable.
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Greg: if you don't plan to pick this series this cycle, then I am
happy to pick this one (#1) this cycle if that helps.

Cheers,
Miguel
