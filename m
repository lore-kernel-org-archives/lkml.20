Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180665;
	b=Vagc/czKOBmYaJjYdU1F6V3LumAn6xAjpt2V1tH3SF5RbdjO4nQYxljK7yM+wwqWNxLv
	 0JQe2ZmspgmqUUVT2bkKyYFe0AYvGilbo0kGrI1Uy14gGgop/0eupie81tm/zECyK0fak
	 PBkB7KL4tbBFpEVz8w5P83jvKGMZ6XF6Iop9sGA8ezP7aQjTjNcxTUFl/uFUFeQaOseoQ
	 8Xz+9+NQIKl0ECvN4Mo54W0DDMooyCerLd+/Dw2nzYrzr6bkt7Tc1Gxs8VGOnfjq2VYFt
	 1wFmH2MlBXj7aYqa7hsG8nOkvRaufuAxADP+/ZlHPaigjHmx3z/OBUmh+iP5rartd6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AGi/fq5S3uVapjyEXBvCZExutq4hUdJTl4OnYwdmmHI=;
	b=4Jya2K9OFL6KnWn7e5Pk4UNMRmaSYn0DY0AycXck8wVQq1AusDDZoZ/YM3W82ZfoqlD0
	 JvjRxNxZqGJzGr9Vg/SIFVXIn88/PiMnPujWIAntZL3NVR1DBn757ezR4mhwmHcFckuW7
	 OsA5mGkBHXYAb244T1jVZ2lq0CEiNSIFOQnxgrx7BNPWEOVsTGwuOn0EbUji1bJ7wfmOV
	 EZ5LI5xyZEjhs9+AQPwyjieUS60w582N7k/2ad8ZVpgdysOSQ+Ml0kEx/SItzkMV4C2XC
	 gmYj3QZ7yIwqHDcynH1YBPAvOhUy9645YikTHeMws0AKTxGsOqbVPTvXL2AHsYXiU/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGaw0Tu+;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB3D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGaw0Tu+
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so350030f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180663; x=1793785463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGi/fq5S3uVapjyEXBvCZExutq4hUdJTl4OnYwdmmHI=;
        b=yGaw0Tu+lQn1sWU7zA/mYAVKKBVR7nOAu6mb67iT3zoNq3Wp87S2RrN1/EflDlYxlT
         IRl8yR5fwcy/Zva++3P4VfLi1oePleYWxLyL3MjDpjchi+eLR3kTIt7XmSWXkZzfn5so
         Yz8lK3F6RFmsXHjCOnI05kV9BA+ebH/uB3YQerXOs+D1oxf1Uegg59kBAk5YqcQx+kcO
         ekpEoltSWiqwmyr7O9Wp/mPFSsDM0JeIVZR9Id7wwErOBW4YZNBi6auE+TjCNbWLn9iK
         YJC6rJFrH910ayxEpYvnvIUG2IEl5VyAUAtWGTtOCGCDzw449oMQBXvltQi8ONU3I0+M
         yA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180663; x=1793785463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AGi/fq5S3uVapjyEXBvCZExutq4hUdJTl4OnYwdmmHI=;
        b=KqvZYLK9O2bGhoFVGa+gMI4Z+kI7T6T1NYrLirQ+kLJo6qiU0DlQpWG7Pge6qt4n6R
         v2SCvQutmx4UwFct8kWb/VCPJzS5WVJvJOcdM3GprPZjZ1AfAa+8VXdc+ZWJJL7YjJJt
         9lg4nyMyIDN0HDhMHi5dFn5JGvHFUF5kAcwqNVIWisO1QEBPJGo14fDDCte8ExG5zc6f
         wlMLFmFab8C1Gal7N6JsIqgCeu6u3gCX6ZQ3MY+xl7Ez0N8XoLWDsCAKIX4O1FDylBO/
         SgWqMz0cLtWu+iy3PimBNTu89766eu7B77F6Dn6heDVxbl2aFF48eVjun5Y2Rj/XRE+c
         SlaA==
X-Forwarded-Encrypted: i=1; AKwUvBxBw01q1uOLSFAXIT1ky46J/5Z3yeoc4vnw6/gFKDUtqkxQbeW0SdjZfmj3bSkXYiaadxV06JDyMgVk4hQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIykTxjfz17Cf04f824ahym71IjRqMSNBBdhSefvkaYsHBKmgl1
	grt5arhWTL8AEmVQ3epEVTQD+LTesBhYs4VjmE5sbTFq+cpVE2XRCDP8
X-Gm-Gg: AYBFou1sYgROhc8+cALavknCtlKBQcIQhVVaPaPlS49ymTd6XXOrJMY6m9pTGlcwxtY
	48EiIlNxjPUDHsbY1y2Syks8xXU2axXa+Hvj46Q5HINZlNpkyFEsZb8gfrcoGl3+GMKxp73q2D6
	v4qVeDeStetjn2fz57xiQ6XCDDgfusZNwI0dyshLyGsZ2wc/t60TkjDEt4oOOfcfwEpw73XPS5e
	LNOYQ5s7UMxettWvgQXQpblmOWO+adh9HezBr/gfjqejwm3OUV5fLmYH4uwCRG2PUpGwSk/7Dzp
	79LCO49HheZDQpt3Bsu/sNAP0ELHYHBfb7YWEitCQRga0BkvW1ZPDqRQTNaYqC+x2eM1OOH0kht
	exQ6AkGzHrSMH4WkRrMa9XKUJMDGqyS4e8MIa7p27kH2aK1zuhJ9nZkYur9ReZ7zMsT0F+rR/bc
	TLDDMVax/SPXIJhJOcqxsdiUwSkGcVteRD1qu4qhJfbIDZ/4TOpZx475x58eMw6YefDY5mKf5XS
	ifMz2MyqIWfsB4lFHnRewKObI3ISaI50PN9wCtLAZsQvSZR0Yfw82CHhp4FVJoJhTEoLkOWKOUq
	ghB3Dhfsuozqusoi73bnF+w0TEde9HxV6HxWmFAkL3RgvnWi9uZMMErbn3jasN72JFKXZdd/3z5
	WD32mIj3QWlGkgAhHv5DXardQw1uszLXPt5xf9BTNqkRsBL0EVFEFZPihnKiEPibhrDA=
X-Received: by 2002:a5d:5e8d:0:b0:487:b50:101c with SMTP id ffacd0b85a97d-48e5d567ec6mr4561241f8f.5.1793180663164;
        Wed, 28 Oct 2026 02:44:23 -0700 (PDT)
Received: from PC-Marco.lan ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm27514349f8f.34.2026.10.28.02.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:44:21 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
To: Simon Kruse <simon0x+git@proton.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chris Simpson <chris@nilk.net>,
	"D. Manresa" <dmanresa@gmail.com>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Tony Garcia <tony@loafecho.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: i2c: ov5693: Fix mode changes, flips and autosuspend
Date: Wed, 28 Oct 2026 10:44:18 +0100
Message-ID: <20261028094418.13598-1-rylos78@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028082920.63853-1-simon0x+git@proton.me>
References: <20261028082920.63853-1-simon0x+git@proton.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Simon,

On Wed, Oct 28, 2026 at 08:29:32AM +0000, Simon Kruse wrote:
> Unless anyone objects, I will rebase v2 of the conversion on top of
> your whole series rather than the other way around.

Thanks, that works for me. I'll post v2 with Dan's comments on patch 1
addressed (ov5693_mode_configure() moves out of ov5693_sensor_init()),
so please base the conversion on that one.

Regards,
Marco
