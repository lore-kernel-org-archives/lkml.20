Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E944749F6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324928; cv=pass; b=a8skOUYqCuY43T9RxVRETenJxG5xMlfg0iQlI92Z2j25/U2IS0CR5RrWO+isuPPxhFy1oKY0RhXhuWHST/U8GDNHyCY8okExmaj8L/CfbnK86K6PHt8gMbeUiBh3Btnuv17wko04STP8GgZEeq1JDchbxVEASjEOIR/m07Vy9aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324928; c=relaxed/simple;
	bh=EQbxlDZ2Pxmd04MLVhgPkCvPnuaf/4pa06BQ8C5/Jzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxx3N8Z5yDhLg57WOXYVGGY2EZBwKtE5og1FR6Q1LTa8GgUW4IB5Z9CSjcn2lu3Ph/mSqPViQs5Hryq+oRLj+Ds9owIR6NGTp/8PQ/lsA15WHwtMMED/uNhApU5kkm3xt1xEceXGXtXT+WANLpzZ6PM6vSQk/KwF3Axq4nyIBIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPyh4q8z; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPyh4q8z"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2aeee96adeso31190466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790324913; cv=none;
        d=google.com; s=arc-20260327;
        b=qQvk18/sITt4i1TY29VN4Gf+LeaXM3dWbV0CPR7EuA1OxKzYEBzUBY6nbHO9RbECtO
         tCQ7yn2ZMvsC0l2IIkRddsxb8mPHq6YhUxOP2IFn2VP64OnegehbPY5jS8S8BGUISJlu
         pB8T84/nAu9Z6nEaD9Wue0vKoiydO1rd9hVXD2O8jgAcfjXiwHtGaX4Fnrr063pGjV2/
         e5CSmsvtiGZdGsbXYygfWi1S34Cd0F2mohcXlDOT0Zh1Ungu2qRCym4oJtPItqSfoctg
         ikyXgdWzIve+EQ9HTGorUD/Qj/GaRDNI3hmvwBfoaOM02a+DgjcvbvVZEVps9Z1mDE/a
         Cz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q1gcwgKHE2o/eF0p/9qzOmI8efuyhVZE8JJPzxDfjp8=;
        fh=soNAOpQpS/UE7T0VB1kkH1sK2My73zsEZz5pGutoIjo=;
        b=oNFIagE+F+C+qwT+A9szb9Gkv7ClkMow0XfSBaYNXf5XqGZX+9PIlbnu6rvsM1/zuo
         jSL63MI9BQwZcuBkS5Yy6u74n/7A0qqh5PDr56PjYtGZNtFJS7hobVsQ2g99YD+6+i2M
         +w3vz+VPTA112uUIVHQQrb4JOBGssI1LgYM1mHvHkHHdhyGP4nRMCt2ZhByTJvj9p0o0
         layt3uzrNuxCiK+GVTzHTNWQdijDmdNS1ju3gcV7IfOJW9leFJTzRU9MGdwiSvwq205K
         8wU+BsXwU7G4hi/Rst7/p/ATqtQZF+LGbPd7F50M8U/1ZdRdHcb1HgqcL+BH+3zhRHrB
         S7Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790324913; x=1790929713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1gcwgKHE2o/eF0p/9qzOmI8efuyhVZE8JJPzxDfjp8=;
        b=BPyh4q8zm+qh21MHmAltAxjEbQc3TRxffCY0i8f4SlcQN7ERJO7rbi6ssBhmkUU+Zv
         8lr1UeKxp2kCYHBZlpBX+g62wEK+rOFX0HV8fIUWYALzvDXRAoCBd7WSYE9PsuK6l9pB
         ii8MO+XPdYup94SgEsWh20CixrkPKaYQzrTvY5qkiRMSswNPUUH5chk874kD06tlbdMd
         2L2ESwAspow0XI/nKUxZsjTOQAwM7JFuI5e3tA0D2nmLbROP+3bAWZ6+5mXkti7XNjs8
         h9ny0kCKmwE6TbN/pKEMAAZWMMAWbKazCefmrqXdpjPVwCVJd8i7zHWia5g+b3eZvLao
         Jf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324913; x=1790929713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1gcwgKHE2o/eF0p/9qzOmI8efuyhVZE8JJPzxDfjp8=;
        b=UC952c5nz7zSxav/O3pd3li5w+RJgID1O0AM5zfP2YZJwmP+o+FEt5Am9EAVy3uTKA
         0zGJVdiqFutcQq0Iu5kngVBbOkyHt6LkzwwvxKY/DGPfu7CZRlhtkn158zp4q38116WB
         gji2NJOcfwSO7h8AucytwwUaejmKt9oHbDW72kZXmUCk1ZbRLfOoITIih/HCIYPycPK9
         /1i++tBmP64g2i9Ys4Tulj9R6nCCbTU7lLZgYOxpnQ/uWWiskiCtvwPKlXAcCZ3VPAua
         0fgZwfcC3d+ZSPusshcKSUldz3oUPvE6L6qa00/QRNNclmpu7iaA0OXF+4+iRgQwOswg
         GK9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNjqcfkBdaxQXmw2DUXS4oU/BlzWSrKLKmi/TkXZ/6+BMTMMvus5s4DRP/s2fkAwZkwcNGMNtcWnOs9Zo=@vger.kernel.org
X-Gm-Message-State: AFuF++k09LFoeskRppeddrTvhdvTdnbq8FLXICcF5T/41hf/+5T0vICT
	YGRvKeOX2wKr38Bta+uDiOll6rC13pRXbO740YqsVXRtIImoz3ehdyTD5905zq+dKkscpSYEVq7
	Vz/f+DZX0g8JX8Vyr+jPdd8t7XoqUeQM=
X-Gm-Gg: AYBFou1cSQj44phTbaQZmln8lHZflV+jJHykWaTuZlknCtXl1dowks3G+OjTOPrLROa
	aHmXogVVvpQHA44Q+ndAgvgd3X3J1V0/ccpfdU2vNPuyKOEAhFy0Fyc2l3sP3WgjWHNPiEa7I6x
	F+gmOUvT1V5oQ8bHe8DnWk9sEn/ik/mRJERmEXQC9iYv65nzUSgXVoyn0fFakTpJwGlXnli+vS2
	g8nj5a75Ylt6eXmS22nRLusI5Nss2mLNMBKmjE32ioUjc0N2wGCoOQG/o/JRXd90hpgPHvWDzmI
	AOztYn3jgbIKl/0GI66SECsXznnivFrEpPA+Bd5UZq5qU0r1mATj1Ty6hdTaaiIxGHECmHPD9XH
	DXKKgyluqG9p+CaNHN13nYqlpnZMq+Ca0ArZ8EsW+xH5QSFaxEoJwDESWpi6ZEE3hgAlRNusQkH
	BNztl0OFH2wvlkkCUPNbzzmOBdyLh6f1V8Y1qCIW4V
X-Received: by 2002:a17:906:9f91:b0:c2a:8cd4:cf36 with SMTP id
 a640c23a62f3a-c2ae9f6a802mr113044466b.34.1790324913122; Fri, 25 Sep 2026
 01:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924083512.461838-1-peng.fan@oss.nxp.com> <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
In-Reply-To: <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Sep 2026 11:27:55 +0300
X-Gm-Features: AclHuK9v8ThjxwkXmKFN9Q8U5cIPNT79Q4CGnC9umBYE0HzIKSyDvA5ZTne3z2k
Message-ID: <CAHp75VdBbr5TgEXrJ6XDQiPvsGfhyKQmVL+zUQ3mNS=GiWw1RQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional set/clear
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andy@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:14=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
> > Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> > the simpler regmap_assign_bits() call.
>
> Applied, thanks!
>
> [1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
>       https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321b1bdeaa=
a85

Are you going to handle all the Intel GPIO drivers that have a
MAINTAINERS record?

--=20
With Best Regards,
Andy Shevchenko
