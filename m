Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC1437D11F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187022; cv=pass; b=Ptzayl4aXriWfo8EsCrO5T9Vby9mwwxQrA8c1G2lwvSok4h7TEHTXOj3SUECOee0eMptu/b2rw5TmVTh57mZd04xomGcFmOBLtRSrQoVoGTPnCBySwBEN99UphQejOUpcz0+TT7YfV1uuq+aFc1GuPbL4CJBMDn9wDKUVN7dLpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187022; c=relaxed/simple;
	bh=Cqt6Fu+sk8V6mLKmZzliQOQ130R6uksTirlfpR1CVrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xvlh5Eg8DcKbU1EcdlFGibBRoGN/1U6SuuK4oFykiasieiZYoU4G6H9VCIlDHe4z2Qe3c5tsfPvdAJAYI/56qzORt3XFXmOtSyvWfK95swvkg9uym80BuvC19mnhB82iB721V9QCPf35dNIUKtyvk18kiFJGtbNsGKKogw3s/eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdFTF936; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdFTF936"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6ad59dfd3a7so123467a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791187019; cv=none;
        d=google.com; s=arc-20260327;
        b=aHR/BnxgA0VR+0+1/lIpoExcmALVcPXUgPGPg2T3hgT3BWryljbgh1Ss1gp9R7t5fN
         FI2rsRrheMpTu8OUlp87Mm/F7S1hh0mqw3gG3gMZ6cjIjePkrMMbdQm+dNYXO9x9/T1R
         bFhn60LS3ehhKTzgU/yQ4f/NXHEyEF4dSPOlPHJTNguk/8wanznP+70Sf57KbFziJ0pq
         J/AmqKnYXkyERXnLWF8PLILZTaO8gLIjWB4GgBAwkZHzOrlSR6AXEXs8sDCh0WJlbqd7
         hhmoU69lEiLGZz5y+b6qlLucs7UwBrwuyU5nYqkQDVP+B/+6Y8I0PgcVKFpXaPI5ACB0
         aFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cqt6Fu+sk8V6mLKmZzliQOQ130R6uksTirlfpR1CVrU=;
        fh=Z11LeOJO+HMehSUmo8WhAb07okgOU/t6rv0X5utpESQ=;
        b=b9qSOnFlmwIZ0wtjnHLyZbZO2qcr7Wcc67NJquOz8NzuDRmKpdf90RgOkrdOArKy0v
         tnnRHJRiwQyOi/teM5LTbv7wUa5Cu2CnA9dM7GAP+xC+t4X3QddFejSUizXk2nGSmVgx
         9VTRRkVxiiG6l/zzEhP6lbH4UIIbLaZmYhZGJFLbH261qkMBKhp88uDrjo8/wNbCbisT
         Xpw+82HN7XhzI58gZFGeEoVsuQIdMAuocKf78UrGXPmKNVoYeNsxhauJmRSibsFmmHQU
         3QJ+fGd5xSMUiRKZmn0vKYUjYF64WtfX+RN1LwH8XIxuR5QQpz4eFh8YenSisHky9avj
         Bq9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791187019; x=1791791819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cqt6Fu+sk8V6mLKmZzliQOQ130R6uksTirlfpR1CVrU=;
        b=NdFTF936OLuM/81O1dlM+ND24KqVqhozqAzWRiQFixsNqqaeCAd3FPwgM9BMQEv1Qd
         VlwakQ3Jbexah13atoyKeaBwMHoFyr+Pt409dWN8TuvbyTo5MosAQR7DrhX1z4JFNzox
         6VIlz2f8MXudLIrFBg9pWKeBBD1tlb/PJIbT3dG4+kzIaft/VAYXVpXLrWo1fml1ighR
         ZzLVdexNT3AFUvcRK8/piOsjRTQAhRiloy8BrvPG8xi9n4Nia9W1CbrAq8BPZbMdSQI8
         U4SBR/9zsyigUNMkoKoYCfKC3KRGSY9qef4Qq4z7AJiCc3M7TXr2dHrVejzHG8o85fEL
         PhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187019; x=1791791819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cqt6Fu+sk8V6mLKmZzliQOQ130R6uksTirlfpR1CVrU=;
        b=p9A44ZpEpXssse5KRmnUSkpoDbVp5b3dGvRaZm90XWhubicBYWZeq5h9d35q42jyVJ
         Nw0mzuBVbEFpkVtjuYmEA33xD9WQ9hliINi6QxlGp/wH2jieetvYT2JhscESOQXmdvGp
         zU+jjbN+mbo9y3ShEJH9Q8JitjjKv6Q9uxD9GAu9RWYfTShtDPIn5puwvp6bFdh6nlFr
         OPi1z/RT+LmMEHM2ko8n8niDyFmsgZjZZlex7xxOxurBoqaiR2s21KPKAAhWStWVWNpD
         FkNO9GmFZSJKatn4OqCUItl1PCThls+clda57v4siqotOZC2vqedRibNqIHr1LiMLrPK
         H0FA==
X-Forwarded-Encrypted: i=1; AKwUvBxj1pVNOj74YLrbADAIR2VnbG2VmrhCpN8MomSHg6gS+XvHHOwPNS2ulw0nCpYIw0zUhrLsadw/dtE0Ap8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZkSFPT1BWuELwAER6n8MZXe8r1fMhrqeRhEO3c9WeyhT0OtDD
	AnxPLiX9ekDeFXWDsEL76K3gai5DutrttlV6znsljHm+GkNHTGD3MuYyHUyeSZJDrB5nRJNSw6m
	BdW5aJk1zT3xjQDdA5/0Wl2V1kCAwQac=
X-Gm-Gg: AYBFou1KqYnnjKaIeb7cJ6qvVo56W5YpJ6TM2N6ODPpILAicD/ywGSzQCP7MJKvU1hv
	0sMwx8b7siZ1gWH5TJ1ip0O4VUk8vGnCGSIr91fbu+ILrO9B6izPxBG+R2rzhAlSK/r8EXimSow
	wN1PryPfFIn+v23NO/nIcW9nUPOYP0Q9OW4463G46+mhAou4KsxDm6z7fVXYX0fte1ps/Qm79hc
	eTIKoTiB1JdZT8p9SsWL4LTGvAWvX4SmwOVGLkYZWboMt1qK+AH0m9T13gZghmNjsAjZRblQMYj
	PEF4DI3EfvuW88zz50ipTOyqtBhoQuzWUCEExxv/HVRp9DDk9I21H5X8O68ukUdo0CPQsvvBDJ5
	7jva3sYdvdRQ=
X-Received: by 2002:a05:6402:3228:b0:6aa:d21c:9c18 with SMTP id
 4fb4d7f45d1cf-6af9e2f9d57mr8176215a12.3.1791187018776; Mon, 05 Oct 2026
 00:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004162458.3968546-1-nicoyip.dev@gmail.com> <225d8d84c8e5155d5af0adfbea270eeeda326021.camel@iki.fi>
In-Reply-To: <225d8d84c8e5155d5af0adfbea270eeeda326021.camel@iki.fi>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Mon, 5 Oct 2026 15:56:46 +0800
X-Gm-Features: AclHuK9vopQGKPch616H4XPEsAiU40667tZEfF-9543oK_7dTTKxojOLxqJFuSY
Message-ID: <CAAo+4rV9B=QUBAWZfpHL_W8jCoCLTqv79kha6G-x0UZP9Swm_A@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: ISO: Serialize concurrent connect calls
To: Pauli Virtanen <pav@iki.fi>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 1:16=E2=80=AFAM Pauli Virtanen <pav@iki.fi> wrote:
>
> Hi,
>
> ma, 2026-10-05 kello 00:24 +0800, Chengfeng Ye kirjoitti:
> > iso_sock_connect() checks the socket state before taking the socket loc=
k
> > and drops the lock again before setting up a connection. Two callers ca=
n
> > both pass the admission check while the socket is open or bound.
> >
> > Caller A can copy its destination for route selection, then caller B ca=
n
> > replace the socket destination before A binds or connects the CIS. A
> > then uses B's destination with the route selected for its own request.
> > B can also proceed after A attaches a connection and sets BT_CONNECT.
> > For deferred BIS setup, B can bind a second BIS and overwrite
> > iso_pi(sk)->conn, leaving the first connection's reference and conn->sk
> > back-pointer stranded. Concurrent CIS connects can likewise replace the
>
> Memory safety probably should be enforced somewhat down the calls,
> likely __iso_chan_add() should reject adding a different iso_conn to sk
> if it already has one, since that looks like it leaks the
> iso_conn_hold() reference and the back pointer association.

Hi Pauli,

Thanks for the review. I have just sent v2 with the check in __iso_chan_add=
().

I also adjusted the outgoing BIS and CIS callers to handle conflicting
attachments early. The BIS check prevents modifying a reusable
connection before attachment is rejected. The CIS check releases the
HCI hold acquired by the current attempt on rejection, while
preserving same-connection reuse for deferred setup.

Best regards,
Chengfeng
