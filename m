Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794605988;
	b=sfCbsfbHGpaguEeBaI11oe8Lf04Zz80V9FNS0Yk2vwI2qtjvqWqpN2dIFOWzRD590gky
	 NGKrmCgcK8EXEuCWwteMRBwlt2hTsuyuLq580wCDVOckFJjIuolMGKZ4dtczaBdNzsizQ
	 cu0zPEb8uaQNiJ16vSDkSDSBh6CTG3C6q8OrHX3OghhaY/Yi9CrG7/GMq71BuzLaAwXNb
	 sH0/sbMjD4ezPBpUW1NbgWApMBFEEixci7V6wUPNYyk8AFEsqG2DEvKDQeD9ukUsem2cr
	 G8V/ljB0GumhBJ3Gah8W8eTcGmYYNJRIssJEtJKHxtOpoG9gPpsHEe9Si3blbrzMXHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z09G6Mh32lxTcN93Jth8bp3CpV5mh1cGftMTw1FyV+4=;
	b=p6lCHnG+bDekL47C3knJEuVrWGgF44Qcqx7pcdrAvDYQMFDPW/RIUQyQACyeZkFqddVY
	 seJJpt09SOJRWElDgGY4E7hH3KMrapEzFVDnVRM/Fnj9DuPfibVi/A/i0EAa6o690vqph
	 FOJwqGmtzvWRUp/Z7RPS10fI2njLNYJFb2goym5OnJ+B4D5uG91P35Wz8PixNnOpMdIb9
	 PTpZ5mrFUgyJv+kQsmJidP0OyaRNzbAf0Kohdx3f2to8njS/9Toiuuv6Lc3CpzmmSnBrn
	 ZdXgPodkfu0u1vIY0VI31qQpc+1621clhFApSCqhh4IWtIPP+ou3FUGg+RXH61ilykA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYuf6ucd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E560A2629
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560E560A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYuf6ucd
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b565211890so280078a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794605987; cv=none;
        d=google.com; s=arc-20260327;
        b=gyMIc3Gm7ikti24AA2349X7XwBnljfDmHPoTLbzNxxdam9jZXjn0v1Da2x5YAvsgKv
         RUetKM3ehIESUhLorvJoDVKDRJk6y1CrhFKNsKZ1fvzXbIUjH6BOi2HqqS0oISXx1R0e
         TyS8RpnHwpo7wGAa3/aiLL8CSCO26+y4XyQGt/F7PieZL4mZhJfE4oH2XUyC4XRXfXpx
         8sDjDJ/nkNqROhAPpeo6O1lDrERnCaxj0besJ9SINv3sC7WPICKDYhlyV5FAGEoI2Mbx
         Nc7CP7HhsxIIU8jW8xQa44+/NVbhrrgr9AHH+K7yHa0tGWfWJXD78Rj2uI0nUxjzOOVx
         4tGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z09G6Mh32lxTcN93Jth8bp3CpV5mh1cGftMTw1FyV+4=;
        fh=Pio4HXtE5yrtsormgFYS1PItE95qbUbrKhXByCYHOYk=;
        b=gdxDuD5gdhl6v6E3xFe/KWe7age609AymoBNYavN/WwrzFxJ9OFFMJdgmkL/8TzqDp
         XggbTx1daDNE2fXQDu3pfXF2I6bJ3napxuRA7R3NvDkznJSsqcDo2l8VXTcCLC+ehZsj
         A4e6xpE4ZSaaHH8x5fVko8lsJ8X9TcZw1vIfN05yVgl+f8DmCXV/mYg3P6sZHzVERXBU
         KAI23TGVsnNtmQ3hcqVo32qNmqSQk3+1zo65xHPQaCsqpmCN7Ytynj6DUV7aWK4ZOiGa
         rn9UGURxTwM2idSVeAsa02OC4LTrqSvIyYbqmhG2ilUE1YtKWCY8R62sROl+sO6enX3m
         zrEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605987; x=1795210787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z09G6Mh32lxTcN93Jth8bp3CpV5mh1cGftMTw1FyV+4=;
        b=NYuf6ucdQlZW6jzeitbcergVg/cyc1cbSBBFDiXM+vZjX1QWO592BJCRfAmF+K/O2l
         M4kH7hN7l3NXN18K/csofZeEeh1Diq+i3H0PosJgBls5YxvxoHJLTYbongEUieXFKycX
         cT0q0BowRibrBYvg7uMSd4+CPViFnKfdEqjcyAVgB4LfFsOU+Q/b2oaFVJcykHqxqE7h
         CHXcRlY+J0fDLurZqPDBZDmnwrlm0VFxD0XMnSRUSEeoHMZXz2U2FMv4P04HnCqY/CYw
         G6uQH57n0shjlpzI6Xus3OWfXDfhs9P0XZjIpt6WXadF071uyv0A3eodz/emGQXj4CXg
         7Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605987; x=1795210787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z09G6Mh32lxTcN93Jth8bp3CpV5mh1cGftMTw1FyV+4=;
        b=C8sIKNzl1KONCg2afKcbaPBLJqOa3VyHnfUD4o63Qxg6FW6hN1+uG8VX0jyZOo4qjK
         SsAaaMNFLv/AUvxJfY6n2hLZ65x/FkTu3xbF1zmxrgFv9XTRZStwdOEJW7bG/9uhU0nw
         PcNsOlO+Ud34KyxQcU0YGcCM2x8FaNDKxQNxytVwzkBB4vQae1KitB9pnWhvi8Iv79/f
         aXxfp0iIyrHwDmCdeFH+7pCzzMrfMeaRq9tuQNSpIRZHgjCX3I/62oO0EW/343bO/Fp+
         ZUx2uapBuBcwhhd6Evk4LvTyYmstOD2hQE01bdC/uGAdeuDQ4FWgAN53sycBRU2BqsOl
         54HQ==
X-Forwarded-Encrypted: i=1; AL+hErHNMIuehJVpH/IohPh1uA5lGDyQRgRCLIEZ9CVIjozbsaFhdq1KfgqWOdb3NX4c4ZKPDpLJJKtjy4kVrkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hjpBJeTK7XcWY+aveja9QDN0EgcqvxI8gRXrE8+HuYqNbZUIj
	Oj09Kp/Vqa28DDN5WPwMQmrfRrkFy2pghXfXE7ar9KsOHiTBPQ0ud96H4VNLD2Wg6WmQNY7TS4m
	yuNh766erX0GQpfxFciBI8nO+YX+SMuQ=
X-Gm-Gg: AYBFou0RBkGkGG8FNXlexFUJM9Ixgny1zl0EpP7z1P8eSnQypZnQrNp10KM9onYva7t
	AkuL3twvy6Qt8fYlQ8Bcyc1CFByeDbjc0XOYuhbmoL5wGqOtmPnTrDG/kxtnvkSIOK4Mv4pU37t
	reWSRSpyHEFhkdXQiSPJ4l1ljy7O2NpPQyMCkB4OuAKFs5IEfvuUu19aSDejvT5cGZbU9800UbZ
	5Fp/hcTwgHrPlcujxLTcSbXNoRxSN7HxITlfADPvjN3Ws9zdlQyUOiGRc82Exgoc0rArk2m/MLp
	ml1qvMtFiQGp4abaqh5bbX5hEIkKAeCqeF39rmHWpOuSYbUqX8BS1whzsNI2YbpCHzOGLQ/deA9
	hQeXZmCiLx/reglunN3r/3CHFHtezAkYiVwc0ftuc7IOrTw7JQ+zYzsVEKBK2lFUMmPtury8=
X-Received: by 2002:a17:906:fd4f:b0:c50:850d:7317 with SMTP id
 a640c23a62f3a-c50962e7ec1mr326906266b.2.1794605986507; Fri, 13 Nov 2026
 13:39:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
 <20261111-ti-omap-dts-fix-v1-1-19022d1ff4b4@gmail.com> <20261113-handsome-agate-beaver-a641b5@quoll>
In-Reply-To: <20261113-handsome-agate-beaver-a641b5@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 14 Nov 2026 03:09:33 +0530
X-Gm-Features: AclHuK9qMuSavHyZMHRslPpanBiVn4xnkEDEtZmjGZCm_S2Y7T6WYHlCBkoM4Pc
Message-ID: <CAOWyW_5xDrEmuEpm8LKuDKFjS__kJfr=oDLJT5884NTSfuTatw@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: add eets and newflow
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Mark Jackson <mpfj@newflow.co.uk>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 13, 2026 at 4:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Nov 11, 2026 at 01:22:31AM +0530, Bhargav Joshi wrote:
> > Add vendor prefixes for EETS GmbH ("eets") and Newflow Ltd ("newflow").
> > These prefixes are needed to document the compatibles for the in-tree
> > AM335x PDU001 and AM335x NanoBone boards.
>
> I see no eets in tree user. Neither newflow.
Actually both boards are already in tree am335x-nano.dts (Newflow NanoBone)=
 and
am335x-pdu001.dts (EETS PDU001) but they only list the SoC compatible
"ti,am33xx", so the root compatible does not identify the board. Patch 5/7 =
adds
a board-specific compatible to each, so the compatibles are new but the boa=
rds
are not.

Best regards,
Bhargav
