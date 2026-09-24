Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8164A424D65
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286946; cv=none; b=U+VbNfeDr8bnNtGJMT4XHeaAR0bA7wxkLanItajPsYgITukWbHRL3A78+Tz+x+2Tl16ZeFkEM4PbOJO3fpkhZMjvYd7kf23NqPrD6afeXZ3jME/Q0mQVimpWBSxRtRIuc0Df2giYl/wi9SmfNmf2f8gsuHXIxu9bU5V1kWUi8NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286946; c=relaxed/simple;
	bh=5X2lfJIjjqVFbz4HDDAzzBlOjoJiLvd4Nm6Uck1XPK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlxbMZVkl/JYXZ6ffFqLP4xDE+RixM3Gj7KAnrVL8a/0QFNLCwWyra72t0FcTM0W0lx6AyXZk0z+0Iop62dgMEIsN8zyF7pT+Af6EB+lNfyPclRjoj0i63FJRwmS3kn5czKJkGzo0SnIX1lE/UEmO+mBvY84eY9FqBEAC3Zv024=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtKuF7WH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtKuF7WH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so152609f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286944; x=1790891744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5X2lfJIjjqVFbz4HDDAzzBlOjoJiLvd4Nm6Uck1XPK8=;
        b=HtKuF7WHrsTVSvXavbAsPp2K06p7IbVuMYE507BmaPRK62VTzWKxDF0fv+Yap6mAo5
         AwS4JHyh+wx14Vm7BdAUS2+lnWZwh9k0QNJthIh2UxQW1yIYiRTNJ+/w2cIflHamefbA
         j+xMSO0APvPCRdh+69VXbLefIVU1PwPxF8NPJPcPDTHmnSJK12ZqkOsBqlWtwsqSerkL
         izIL+1d00E5OQ0fhoLl4T9g0qgkmNMVU+pH/p4mjz6mT2xPftDOEbHye6iu/smdFVrlB
         8Rtzrgi3wwwBQLttyEnRDEhqTeBZ3TRFSfdfa+HCaHEn0xjeuZoel9Vsw4cz/UgLE1xy
         etdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286944; x=1790891744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5X2lfJIjjqVFbz4HDDAzzBlOjoJiLvd4Nm6Uck1XPK8=;
        b=X6FgxbrA2MGVFJ2QC0hnodPgRxDMzlQIj10N2ZmyhMCI6zE8xP/6d1eD1mjBXx9kh+
         gewwKlF6sGXr7yI/S41/sXXNfL+D2H/mhlcwKwP9UXeIbu+SFjwWyFody8vuuMVYHnJK
         7qku5tqNkd4oMryXyudmz4gXj38RAbD0HA7EA84RhPowVa1OvR+Jxr0VUJHniWO56B2U
         Vxpmu6igNioHLZ+F25shHTerYcuWqSePhaQ4Klp2h5TsFm04bvCqxXgAkFuc1+JDdT/a
         KECnPpFpA4ifwYabPoD6dDkwQcbuMkay+8ud3WpWRmTvLjxRbE67laYZOXjN58Cmkhmx
         B30Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfKWY6S/qA951ImvNpLzZibGksGDiBjMGdaCQcSRnCApE6GnWS/2ENL+pg15tMRBffWa7eG5cAGf3eqWg=@vger.kernel.org
X-Gm-Message-State: AFuF++liuHMrdx6B53ZuoRzS5NLSRwt5YixH63I0Mh/BMqkKvGv3J7VY
	sHFN+eDxi8WmoMWyQFiEEMcuu8O85d7UBDjVtNqnvcpJwllpifeGs5wE
X-Gm-Gg: AYBFou1cTAJksdYnOuXFP5HGE1uu/0VbjQE0D4zkwUszeleffx5AS/rOYb3LhpZRmRl
	yrRXkHkqmWcgj9yVklPx6UoQ9BUE8YwTgxi1Fvy4dVoTY3bpaiFgbbhQ/y0f3CUDmJlfFqjPoaE
	0BSgsZvLYuVLcJkJg24oQz1Xv4bWskdvdelumueUnjuXDYaf0IOeHtat/jxkDZMDb1R/o4lGidU
	PwIvBHBvlQeVgNvATls8s2bmAVzt4lifrTAUgV3l9S9PdaG13Lx66UYnnNJoBRJjCwKCdiFOHJ6
	2bAS36CfZCk7PEdOnWpNuwv5e65Zt9OQ4I/ahPlOuQOJPGa6eCRlqq9Mxapflsp3hAqvwGU3xp3
	3PXqduvTTx2Pp2dhAHUq6052lw8+b7ax99fE29Cx//jJT2zThILWNNy1fdxrtcjF+bivoNmWAuy
	/tIRJdkDsbq5spmJWQngM10ItCTrfZRa/fUUAmI9oGUJdXGkh19+14KwmRZg/P4k5TX8aBrRY7l
	gWVtTTsYg7xl5SxVCxa1uY3VxLSAmcchU3maWd3Amtk0uwpVArntrN8NDhFyfTMwcvFPjBNzxHn
	KR+tHmPnkxtV8W0n
X-Received: by 2002:a05:6000:178b:b0:487:662:cb90 with SMTP id ffacd0b85a97d-488716993f8mr7479416f8f.34.1790286943685;
        Thu, 24 Sep 2026 14:55:43 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm2288950f8f.22.2026.09.24.14.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:55:43 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Date: Thu, 24 Sep 2026 23:55:40 +0200
Message-ID: <20260924215540.933043-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
References: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark, Cezary,

This v7 series has been pending since September 2. It restores the dual
SST/SOF machine entry and includes separate runtime validation for both
firmware paths on the YB1-X91L. The series remains unchanged.

Please let me know if any further changes or testing are needed.

With Best Regards,
Maurizio Casciano
