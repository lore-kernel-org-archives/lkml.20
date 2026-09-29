Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888B3D9DB9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687789; cv=pass; b=saSpyb7dy7qyOBFQF5Kd5kQ8u+X0rXrSA9RlyOou02lZGROhgR3XdipI0Gv0jHGDWT/gUmPazB4Aq6gZv5l60H8lswvZNtNae8dXMyaIoDiEv/zLLZj6m9rrBjtfBefaXz2jAa4av7yAsCx1iKX4JjnGKQcbixYKsFL2NSn/MVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687789; c=relaxed/simple;
	bh=CSwy1XOEG+HCusC5MeS3T3KXLWEOP8ZUJFsm7HQJluI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZywia2QJlgCUlGu8pQsyxayeJ6qY+fOjCjOtxCn9a0WJdGni1sBUVuSSp07JoFs7YSaS3IjweS+CthPoN63Kz3m029aqHs3+IDw9AKXE5QkGg1uuSAyKf78TQLbiI7jFN3wXDcjSGr7ptS6CN5oEfUL9FbK9NCc6cemvmJ+0Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYKHUEMo; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYKHUEMo"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b485c8368so1556156a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687786; cv=none;
        d=google.com; s=arc-20260327;
        b=n1GiQaV8T1aCEIUis8/WqzEPzYs0MpmYIQSa9pPKWIZfXU/2JYKdhxgnzUGBpLGWms
         jWxmcGg0KN0X7OLpd0Ygeu45EpIMO63aWw4KRe3jqu5S4w5DrwzfXKfvhBihoK8NUWW3
         r1P8vUarWMnTRpLiqXHMiHiZTBgNCBc4o2raxg86eEgZDfsRxfn3ymbo6B3skdROGqRe
         haosVC6H2a4TZQ5fHjcVgU2p9ZjIgDkUa2hvs7uF1Olmniw29J6jYcb+TaPmRtDFUYxn
         5V6/mquC7seenG3AID+nI2MX4FBzciRKCKW/R06WD21goGIRo9MLPSOmaiaDITFrBMLG
         5RIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSwy1XOEG+HCusC5MeS3T3KXLWEOP8ZUJFsm7HQJluI=;
        fh=nYIilzNuAwjM6RhAAFnloEp/dj94BynbzK8OSA8Rzck=;
        b=JLJeyrVWe+xAmMiHo/pXIocXJ2KWY2pMduBG8pSl/1H27RrwLA0hosA1Rm73/TcHth
         i7MBP/IAgSqv4aXLyjL8PapAtpFsajOnOj8ivADqIPj3nA/hez9al1Zi/LpAMYGiLC9M
         FCXxvt6oYqIw3vYEtxt6C9srWGFq97b8xJZo5DAJAbgP2jCs1VTd03TvtFGIbxeWqAdM
         AEfwkBivY3qX+okOx1lY6NAMeBkuEGxZ46qTC9LhhPk21iQAZkTKgcSN0TT8li7yp7Lb
         nGt39RFzmShKyCysDNK6AhAC0wGb7veg5mDEzpOyL1aPTT3dvHIwP6V0+olwLStINVWs
         06ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687786; x=1791292586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CSwy1XOEG+HCusC5MeS3T3KXLWEOP8ZUJFsm7HQJluI=;
        b=bYKHUEMoYJ25wxUFkRMZ5uL+knLysLFGyFDRnDwIInISIIdBR4H3t9Xv14aAt9mW7N
         UJTKJLgaZFIY0fKXQIrI3xnSwWF44b8D4k1qKFPpW3YteF/+elJ1vWYAfWHIWLNipr0C
         3SH7r8KZUGju+aZ6+U33oAWxyJ+d1JOV6Os8CqMMH+CS3sGbT8szQKBiCjX8XUYE7BL5
         +6GKDp8UYBwb6MhnIipTyWWGFF9jk0xE2v2HJtUa2Ehy4makZnvOaMsGWEBhBhfJig3e
         kkTbjrnPD+WsanWUgbxfEF9vD6VK0UK0t1dUq+eixNAwxKzd/Zjer01LoD3PMuMWJaBY
         c91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687786; x=1791292586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSwy1XOEG+HCusC5MeS3T3KXLWEOP8ZUJFsm7HQJluI=;
        b=GR6vbQsKDdhYSogf/7hvuWMBJ2fyy4hUo5+k3IM98XhvWU8bO0hWZeehNT9se6JLRY
         tVmzTS7TgfQc6bIsvdObrWG1VL2DvzbMI1mUBtlYpUJMf8+M+DVoB8AUiWv4wQXp7Lb1
         ceoT0eklTqMJ3QGoxyXNOWF/RRTIlL91Re1gt0lU9LV4J/7qNwEZkchirqnqb0dINuTk
         SG2SpNjKMSE14/GsIKguSkVHAbv0bbuyRZV19O/TINd1BvffASrIqtOdnoeAXB0fhCcC
         dPAnA4o/wLdiWBWTNYpOA88NCpVNbKCIrzFzgU16dGq4qbpf0kWdCDrvovMV0PkP9ry/
         qcbA==
X-Forwarded-Encrypted: i=1; AKwUvBxI6cbojYeYebqNYzkbx4/Mw0pFPaxelwhg07bEwWinmgQd9piMOfZ5QH2txHxbFk9+7NPD7wJZli7svdE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXTvT967TBXzVbBF7Agg+fCy3ph70GCBHZXrp+dIWncnn5RyUC
	rBKSzhOjgX57M7Dw7ArOHhtPM8GTQy/rIix0KqBkvME2XMrzi4OJWqTtzDLvmvUmbrVzvzRwl/T
	T3rDjaKufsWtKRb8SwEacuIqlOMeMgdA=
X-Gm-Gg: AYBFou3ka/57Sn2d24AyqijT8jsQIosiQBMbOmMynI2a2oLzYyDtQ6/TyMkj00IBIIl
	j5guPIAj8mPGUVzK8+MnyxuMKZoJNNHbkuFN9v/ouPvdN7loIDJHehlt4v/vO3wiBWwpFHHSoDL
	Jka3/kNqrmQRkjdn86ltiiEy6wCqRph/biNh44Au9xv91JBRIbLgOt2nP/KyqHaS8DjO1dWk2cd
	9fNk2d/psPQv2Sq4Cv2dw/i+kJY1foIQDWroWvcV3RWb0dQV+LJ1Mc1uL9MnLTBKnwY/AIdvgA/
	3U1HjMur3T3JAJsRvSZsS9B8BTpI1z+sxTP/3fRglqYfpEf662+ih27lFpPNIrvcFlZDWVXV1hz
	0FA41dOrSdYdocaROJWCRGv69OE1P0KsmEzR6I2ghwA==
X-Received: by 2002:a05:6830:6b07:b0:7fa:ac4f:79c with SMTP id
 46e09a7af769-81782889cefmr15806453a34.24.1790687786319; Tue, 29 Sep 2026
 06:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929122226.98970-1-mikhail.v.gavrilov@gmail.com>
In-Reply-To: <20260929122226.98970-1-mikhail.v.gavrilov@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 29 Sep 2026 18:16:14 +0500
X-Gm-Features: AclHuK9qxyQVFpLMnQcNjSC0ID0ApIeGlcHTJ_B2ZSS6iYVlJWm0BraMGsEB3zk
Message-ID: <CABXGCsPUbEYq7cN+SyicG0W9311QRNRFvybbmQrPnFtMB7kfrA@mail.gmail.com>
Subject: Re: [PATCH v4] Bluetooth: RFCOMM: connect the session socket without rfcomm_mutex
To: marcel@holtmann.org, luiz.dentz@gmail.com
Cc: nicoyip.dev@gmail.com, pav@iki.fi, r772577952@gmail.com, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 5:22=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> An RFCOMM connect() issued while a BR/EDR link is being authenticated
> makes lockdep report a circular dependency, and the reported cycle is a
> real AB/BA between rfcomm_mutex and hdev->lock.

syzbot tested this version against its reproducer on v7.3-rc5, no issue:
https://lore.kernel.org/all/6abbb59e.64639fcc.9812d.0003.GAE@google.com/

Tested-by: syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com

--=20
Thanks,
Mikhail.
