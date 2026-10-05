Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B5481234
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205012; cv=none; b=F2faxGURWzbDV/2BrysDVNA3okedo6r3VnemL7m6Kf2N3pbTvgA6GUG4+iNZKhWV6xOQ9AkfUcPFJGY67zXaff5Yl7p4v+TAZoNpJwXGvYbsogGpwHgJqeE3yZkWhQ04a5fO7ZzZErxEthFLrvLJlUM3Migf2UEkxQ7BvLRd+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205012; c=relaxed/simple;
	bh=bb9p4HBvcxNOQ/oImkac1xFQmfwMQ5ihcG9F8QvpDQc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IoIh4guMZba8W+O33MWV5kES1t/6pCAm0Wh/B6Eqd2EGmn3H84+AUHC7bpwh15nAMobK339b9Mz8UeNqh7bvvyKZaKJVsN/RN9LEzrXuxbL2ngXtLCSw19h+pR869VDtd5HfyuQ/M0cHSqNHZxTocoMsAgWe89zbNUilWoYODCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBwdLXRh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBwdLXRh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so10680695e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205009; x=1791809809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W/Ouz9WloeKvUHxr+IWiDIKxmL82mM4htq+/IQDKXxk=;
        b=UBwdLXRhUAFVbQSEuwOv0k4O9rZ8VsKqu6qzzo6O0sG9YHAuMtoojO3NaBxV9maYeO
         up2qGmJOsJph8ybAB/AkxismevsWyb3g1nRiw9zp4aiiIOGbPH5ASIBfi5WGYBq85K8W
         PQDv9tqdn2WDsyGL1SbXAVsyREaWeMXqTHUyj+oi4GutlZknfdsqU8cs4Lq1vh5lUWdU
         l0Sd+ebfCZIWXwWSxs4mfgOomOmgqRJnFIdn3Hh+7PcqQfoR+Zrd9W1SFVvFxs27zz6Z
         JOs2B5mzaScVmR9PG/A6s/aahvx2fgX81wJwlWIPHujS2rgSiLez4HSR18wQ9pmKue08
         cBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205009; x=1791809809;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/Ouz9WloeKvUHxr+IWiDIKxmL82mM4htq+/IQDKXxk=;
        b=UEtAJ8qYIFQpLFOfxZIbSI660zr9XWLZHcBkJfTfQEVBhXUvbOcrNW3SAyaaZK8haT
         S5kBJVyCAIKvIjxR6cWINo4W3a+8LrEHaySeYL/89hv9zjtEK+Zmrav6SUGESn0wPzfc
         OeLVxWseoupgY8+GKvLL6vLFca1Hw4scUQ/y8eE1F8YW3qTcMjf7/ZMG/PB1EACTI33X
         4Sgx1CLulgao0YepkKvUy6evOoXIw6KKzscMeQ4G5C2Mt+Yugkq46eX/2Gm2KiqC6KAx
         qXg1fNQ+9CkwY1nq97RKLG3w0LK4cBFk5Ukzs6nHC1cogSHoLL2aiOBflbJ1AmpuamPB
         +yWA==
X-Forwarded-Encrypted: i=1; AKwUvBx8tsPmxySojDNdrCZY2mB1ur7beFpWsrGKDqj/LxzsPLjMs0SEMW/7QBc+G/giZy2h2VOK9jyZGcBIAH4=@vger.kernel.org
X-Gm-Message-State: AFuF++kY1TNHuDBdeyFLaFyU90tU8msx9fNV6eFhcxSsN6X1T6LGb3+m
	uBMKeLDoMG8QSYQFfsZ6q9Gm+8q3ilxw61zgsUK3p2HODKdVhyUnPTZS
X-Gm-Gg: AYBFou2VVRZVX09Yso6CJVx4ykvo5X0w5mbdifqjaUyYYd5ZSFAn53QMHfv1sldfTBo
	1zoz1j5hiAM2LMI13CloPFBSaRYeGvH7hB3QiJBfiftvETUvKeLhZQyFNXQwduGwEoUiJ8Yyun9
	9N57Bi9M12kE6VOeIVXa4OplHp0q9obKQymzyx5Vkw0gvBvOlEzSMrZdszpoHjGdg3jhPcVIka0
	EhZI3UDJz2jY45t7hbhvu14gHUKeyDEFBYBogvUvz/Mog57TIFi0Jh/IeFHSwFV+9McMUU/VLd4
	O56yqd39VZOHQJB5MHDD5TfNPcGtaFZnfQ0JtETRryYWTMABoWgQQwvkwFgNR6eM2WHu5ulaSIx
	+WwXo6dfpozQi1OxMUgd1dh+UBipo/1OcTWEV6hAhI0Z+KYide4YJiPADdVCLWP2IoRB0c5ICBy
	f2JYj4NuAUdX4LT6rc6aDezw9pzkmT/D3PTfO2X7SIwt6cL6z7obiaLUiSKnqgnKWyEEvZ2wsW3
	ZD/OoWTQEpq9b3snyI//cNnKXr8o4s7QfP+PpZlVQjyaCdlcQ5xHdcfKL0oQLu8avtpg0C411q3
	lX0zxWsMywemYcQumutd4acWesenV/RwTKb5fufYUls9NmzsO+P0ToTs1ob0VuZihT83kA6Wrm0
	u1TP/KAA0TuSmPq6R+pOH6NyGIQP/7LiEd1l7OXzgqup8OzohAWI4Wdpw3BKfFm9UCND3O7QJqw
	fOyUXx
X-Received: by 2002:a05:600c:474e:b0:4a0:1bf4:edbd with SMTP id 5b1f17b1804b1-4a027573d30mr166221905e9.5.1791205008939;
        Mon, 05 Oct 2026 05:56:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704c1sm2895736f8f.10.2026.10.05.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:56:48 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:56:45 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 09/15] iio: adc: xilinx-xadc: Drop unused header
 files
Message-ID: <20261005145645.0000170f@gmail.com>
In-Reply-To: <20261005094205.1045874-10-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-10-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 15:11:59 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Remove header files that are no longer required after the
> recent code cleanups.

A bit of a misleading commit message since you're also adding new
includes as well.

-- 
Kind regards,
Joshua Crofts
