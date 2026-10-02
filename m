Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A7547F3A3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932718; cv=none; b=YY9c9R1wb63jFWUwQg05D4Yx4PkwTf/i6+FbSGyPw6pfJRkkOlDIH9SBNHB37UUS3xUjk/zpzMdiRsf2ITrU3xlKzGQkaiIgjaNKxUq+pJR4Xsf50Ydhj/XxT1ewwDdZxMWKPYjA0CxylBD3m+gDBaNKFjCq1e4Bed7ue60KLOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932718; c=relaxed/simple;
	bh=CNsKoYuKrrSYLzKvtVyS7tgc5mI2xbQRWIdL6BhWXcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P43LIYhdbbEkDA0V+cUh/YR9sjwlBhmJzushehVYj6X2AmgLdzeSH60WB+zhlVnBfOAOwb/knnbI9Sy53xGCM9uHIZ6N8zzBgh3ChSIgWWE3lIsdQ3REei7uipJNdU++5Yh7EyiLX/QgcrBHUqBDe/QyMpOpecwJ8HKA7VP7MDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJgT/b+X; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJgT/b+X"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so50065285e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932715; x=1791537515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOOIVnS9Id+XkrrN4+pJgTtAUkmfSHTNwg21WiGg0zc=;
        b=dJgT/b+XRwldmwKIgKJlHrFm3IEXO65PuisYc7QxCIZitz4O+MIk/XnpWN+qK5PbI4
         eX+DvL83M12RwNxGqqOjF3NUJ7PVhPa2wacI7T6qfwlWUfc9tMyZdZhHDLpGCfrOxZpy
         I+X8umH3sEkxLJ8AaBRDRSjWg0/XBtZJtCJiTrrK1YGL2xLCtg0LKxQqSPgEEi78KeDY
         0DAjyeUin8fQnVJtfLa8iHBZzSsDqVYykiv/I8VPT5Qr0Z8jOvQgJsEy2WcGfumOGvON
         0+Vs+1mJ5K+9oOuXOpGIuIkvBuXs3rbfYlfJwN1XrB+a+OVTqLEWcJRXgTdi8OCpu9+h
         321g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932715; x=1791537515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOOIVnS9Id+XkrrN4+pJgTtAUkmfSHTNwg21WiGg0zc=;
        b=BBzEqdVIrhvJ1q4ePTcVTyDf3AOOa43ZpYu4mQzkgFtt8RzerUQMyYYGGRFaO6YaxO
         njLBJLOus44/K96MW4/enXlYQl+mZCYS0ZG0KVXeb35KhliLr9VurXvUjmW/EzN3EpB7
         iPs/CA09u7DGfL21f/j4nrI/0hnwWCd8pjAqJuHB1SqN9t5Nn0mKlJQX4na/Jebs2WD2
         9xjD0DoPItOIcvWZZBfHHJvxix8fTMhthiFxJ8WaS4S6spdYa3K71XYsCV+CTNbA07N8
         E2j7jGGQItPcHq/YmtElHt5YsqGFyz053bThVN/DtO9sttRuD952B8CN8YXdvB0UHPZV
         7XQg==
X-Forwarded-Encrypted: i=1; AKwUvByKWQA/xDqPWwHM5uTADSEoQUBlaR+gpLLnB7LeU84AH/RoUZWvV2kQJAcCU5xOBHfwIVmCDvKTQ87sVyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3w1nl55l0pooB3UtW+Gi7gcpQKzKKsp+bAgzOj85fozxKAi+I
	8rGBfc2S+I98w1MrRxbcrnpcwyond2k67VOGeR1CFhuFYVBEgtuXoe7i
X-Gm-Gg: AYBFou1NUhcTu/LbPEZztdEla1UWFKvEik2IQeL5OabbHrRYgI6XtuSgdGalPRRvndz
	ANTHRiLWoA+rXm/EKwQ9UHh1ttM+9rdi3te8xlM5mYaSvsPeZKFan1XE2K+lalqdImRIbKuq72g
	/Vht/nNHqgnpTQhzy/LoYMdNvBbKdGLW2SjkSvWQWEbD4bNHlpkzGvI/z9hdaJxxttVdKpTS1lP
	vs7G0EBom1Hains4M0OUamD4KVhk0PQDjMmX6ceaXQ7KwAEH46YnCd1HSHKEMJu3J/oeadtu9Kr
	fgJtL0Kyu+kNSw/lkXPI0fTJeAyGA255tE10kWgd0me0T0weS6ZT/30dMZs7ntPr01n+UetpIBp
	7KZybxl1vE7h5YxX3kMzeJ2LNvCtXL1rK3gfyv2g+/gBrQRHA0KtdL+glLuv6gvPwtAe6mb2Rza
	xEIHp1r8hjgrfr/GbfLBStYZD9EQVy96JL9RnHIE/eo56B62rboRxglQ4YALEyNHIXE4mRXxHLP
	woptiYDD9uDPEp2keRQAy5sS8C2CBMW6nVajLKD/XxzZ072nuhyKVO9SYY=
X-Received: by 2002:a05:6000:29c3:b0:48a:f486:2f4b with SMTP id ffacd0b85a97d-48b1270b14cmr2501451f8f.19.1790932715363;
        Fri, 02 Oct 2026 02:18:35 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07a9sm4984917f8f.12.2026.10.02.02.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:34 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 02/15] media: ov8858: support 19.2 MHz clock and manual white balance
Date: Fri,  2 Oct 2026 11:18:32 +0200
Message-ID: <20261002-media-v8-p02-andy-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75VdeXCDBpvsom2YokbS2QbbCzrGGf_NXYdLFTq3cLeam_g@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com> <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com> <CAHp75VdeXCDBpvsom2YokbS2QbbCzrGGf_NXYdLFTq3cLeam_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed in v10 patch 2.

The 24 MHz constant is now:

  #define OV8858_XVCLK_FREQ_24MHZ (24000 * HZ_PER_KHZ)

I also removed the trailing comma from all four newly added register-table
terminator entries. The final patch passed the focused W=1 and sparse builds,
and its reflected B4 message has the same stable Git patch ID as the prepared
message.

With Best Regards,
Maurizio Casciano
