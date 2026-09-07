Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D0F4EE853
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794478; cv=none; b=hCfSC1UqDZt1vdZBBIA18RcyPVU9iaoQuNyRzVqTUAoomRGjEBvSADaoc0N/wn2fQwDsq1Ea69VTNKIo9DB9F+DKn2a0QUoj6sLpY0oYnt0yh7VLIz2QijpLZ/7XWKEkqMvhddPLetXMY0eNxjC0PmrGZns8uYRNPz8+b1tT4RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794478; c=relaxed/simple;
	bh=Je540+x0RLBrjADL4XgLC8DmzHI3N9G0dzH+bqi3T4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qt2KLvOBKv9FMCB7naTRYl2RU3jyDikhlkRLA1t/T2SwIWbB4zGWVy/x4IwEEVNnkVQKE4j4WNAwazQaNjPt4b6cDLjpS/uWkO8eBtYXCky4zThEZog4mGVHrDMegtFNcPzcZX1KUjfedCNNdyKOApgNSPMW7FIbY//oUUz93r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW5UwvgY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW5UwvgY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso34978345e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794475; x=1789399275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Je540+x0RLBrjADL4XgLC8DmzHI3N9G0dzH+bqi3T4k=;
        b=TW5UwvgYd+Z348/MHCluzx9vWPmvDNgx4x6AbxBsWhekm1fWz+2pAJi3B5LfRIX9t+
         9WwnWxIJpefDD8b3o+1R53IMplrjBCjlr2g3R7A79yHUbMnPusTe9z2VSfvHctolgAJK
         JcC0G4SEskUIBG/HRBwXnjpssbMtKxmXM94vT/Lg9cDLglCP4ItN5KE6GMsRMzm8pJ95
         2grcrZVMKTS0ck6kI8XaI5fHAQILxZlwbAfR/FEhzlkCCHEVT9kFB88zL0Aab2RQZS0M
         +R43XbWo15LUv8/EeQdtg013BBYKPNGv4ecYMy4kR7knTXqDOboWG4DQJy7kqAX+Ymbe
         x8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794475; x=1789399275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Je540+x0RLBrjADL4XgLC8DmzHI3N9G0dzH+bqi3T4k=;
        b=sbznO4Cp+lmzpBKIPBm1UBaGVaHYLrK0tC/B1Kln/nh4jJc+t1ROUW0Xw5VM00GW7r
         hGkE058DNXoFhrXaU0d6JnEDO5El7Nn1kFDdinnKE6Qjb4xkIxVgOgoXORWZ/7zgI8JO
         nXjezXxKEqTMsJrT4iUj7FIKGJEucnrsWHyp3WkhwMMF4csDuRpCXHwHPqFxQqaLsVWD
         L6Fuufye1nohJBNV4chxXJ2aRNXzT0pyAi5z8AumlfSt5lPm+m5+bqZzVqPKeDcpZrtO
         LCU5SXxxoxuvJLsmZz3+z3hVvp1z4hWHgsHFRdjEUTLylorxvy+wjEepRy4qDhvl7DxC
         aQ4w==
X-Forwarded-Encrypted: i=1; AKwUvBx4NP7bP7mXHGALEJRqtTx6E2fqQMHAa9vyOtwzhuIVM0HNHO1OIVdAbBV7CrtXO07pFUSu/+/xDmGa2Us=@vger.kernel.org
X-Gm-Message-State: AFuF++kqqw/45ihWmkZIuR8ESgGNUteAVhIxbOEUR0bYSEUa6HLg4QB8
	dBSd7sI9vDrAjr8Tp0HwP3LN01iaXxn7EWnZXHplZiCh4AP6q9j8pk7b
X-Gm-Gg: AYBFou1WNV7+BGfdEM7d4Fsx6uF2GEsIL5dsDfiUt3wLymlOK8/Hhf7pnJPtgvVap86
	GAAbE/ZAmgKQ6gDxfW6GAvKB7jo6kQiCtUs58UY7TPC9JmYSMtZ9MJAZGPpSPcyQ40qG4saj0PO
	Uh9uvdBu+Fxa001FENQzC4BjSxGnfMjqy/gslUDluHV1t1Yq89Vc41rJBkR7K60PMmuRbTyDuh9
	QgSv9Ty7cs+QMouP+0enosgzKxhvCs9ak400XB1QTlAEz4VMrZiTTKsL1n0TjAYeHoZK74TVVCX
	/32T9jTSL5gi1CGcvqiKqUi0aIrFV10oq+gxdM96x/bnkHI80JhGVYf52+tE35ySwSEZnjIGQ/t
	F0x1U4bdif7JHKzfQy2mSAoQt263btg1ExuewsojrkuR86pcYWWYndJfldJuHMMSQP7eUGqmdxo
	62oTC7dxOrqhoIu+rsEKH/kFJU8/CdSWnc/IuIdvWZ/V41wjZOJrLfLf/K6pY+mC7Ww1JtC+nU8
	PGhd6U5xEwnDkMmP5WnarV+/UYifINK0zwXjumPNA==
X-Received: by 2002:a05:600c:3f08:b0:49c:fa20:cc04 with SMTP id 5b1f17b1804b1-49cfa20cd10mr195270575e9.27.1788794474776;
        Mon, 07 Sep 2026 08:21:14 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm695732295e9.15.2026.09.07.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:21:14 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads1015: Add support for label
Date: Mon,  7 Sep 2026 18:21:10 +0300
Message-ID: <20260907152110.4934-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905030114.21de1faf@jic23-huawei>
References: <20260905030114.21de1faf@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 5:01 AM, Jonathan Cameron wrote:=0D
>On Thu, 3 Sep 2026 22:03:55 +0300=0D
>Andy Shevchenko <andriy.shevchenko@intel.com> wrote:=0D
>=0D
>> On Thu, Sep 03, 2026 at 06:16:27PM +0300, Flaviu Nistor wrote:=0D
>> > On Thu, Sep 3, 2026 at 9:18 AM, Andy Shevchenko wrote: =3D20=0D
>>=3D20=0D
>> ...=0D
>>=3D20=0D
>> > Since the iio core exposes in sysfs the in_volatagex_label=0D
>> > for all channels, there are 3 situations: =3D20=0D
>>=3D20=0D
>> > 3. The channel is not defined in the dts (in_voltagex_label is still v=
i=3D=0D
sible=0D
>> > in the sysfs), and reading the label will cause "(null)\n" to be print=
e=3D=0D
>d in=0D
>> > the console (as indicated also by Sashiko boot), since the default "" =
v=3D=0D
>alue=0D
>> > is not assigned during device_for_each_child_node_scoped(). I think th=
i=3D=0D
>s is=0D
>> > not an issue since is just the way sysfs_emit() handles an NULL string=
.=3D=0D
> =3D20=0D
>>=3D20=0D
>> Is this current state of affairs?=0D
>>=3D20=0D
>> If so, the patch must not change that =3DE2=3D80=3D94 it's an ABI now an=
d (null=3D=0D
>) is valid=0D
>> response from the user space point of view.=0D
>>=3D20=0D
>> > What would you prefer? Any further suggestions? =3D20=0D
>>=3D20=0D
>Unfortunately we never defined what should happen this way explicitly.=0D
>In practice assumption is that this is a corner case we probably won't=0D
>see. People don't tend to want to label just one random pin, they tend=0D
>to label the lot. =3D20=0D
>=0D
>So go with whatever is most common in other drivers,=0D
>=0D
=0D
Hello, I took some time and went through all of the drivers that use read_l=
abel()=0D
to get the most common solution. Most of the drivers only use datasheet_nam=
e and only=0D
a few actually get the label (if present) from the device tree during probe=
.=0D
I now have the best solution (from my point of view), which covers all (3) =
cases. If=0D
the label string is present in the device tree it will be use and printed i=
n the console=0D
in user space. If label not present or channel is not defined at all in the=
 dts, the=0D
datasheet_name will be used similar to most drivers. I will send a v3.=0D
=0D
PS: many thanks for everybody for pushing for a better solution.=0D
=0D
Best regards,=0D
Flaviu=0D
=0D
>Jonathan=
