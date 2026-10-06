Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5746AA8F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295224; cv=none; b=fA/aWMuZgMB0bKvXw1igX2B65l6FZqUYKzSW/eSQTtU+T9vvlhCKotlLPvsfupkm2MQrqnaehoACrogxJsIPKAIAdHK4XPkk/gtD4PcQkBpLJJTqYk0PMzLrqsuxxAyhcQJp30H4OHNxwjpR0P85NXLWqZdAtDPkIhAO0yb/eZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295224; c=relaxed/simple;
	bh=j1khJXtS10EkM2zMqjkvq8yhxUHcp+XWHw+FRAgq6qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjdgIPj3jkQw03HwE1JSjX3G1WJrTP+wHiSoF9kOgl2TV4OwKQGrReO6UaqaQtyHn6LagvHTetPB35ZBxyJvJt8LIuqiNQ0vDm4WffK4sHUj3/3HX07sS64SXq2VACo38f3iQjw1mZjgpIX7X8oIgpoVjFzyNRzes4Wm4xwvk9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOaR03sr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOaR03sr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b93204449so1480625e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295222; x=1791900022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxIH7tVcaH4/LHoTc1gJIz3XjhP3nLsv7ZMM8u1zMVY=;
        b=WOaR03srM4VEPcf13yoWgn9l/JyTlhaHTBgph08IiB92UYpn5AhXWEnPgzEN5g+pSP
         DJCwc7jPbheVCsUjWhH1kah4QVN2cfbgwH6MSlMWh1UON2f7XLeuch4x+6XfEXuJ1tVj
         8DTBE8ZGU4S/PC1WFobsGFwrYjTEXs3CvUOGBSFAJncIXbdd8Za2XNn/Kwm/7CLZqgy2
         Eqcm6Va0EudfsDIV3mjfHJsn9XqUshl05zL9Lgxkpyq6NemFrp78W1UP8cDSY/fKXY8G
         vgRSfCoXuSLpBRHegLrLk+k3uVqAi5GKD3/kgybLFNnSOy3/FrO/Z9mRZ5k8PfKz/B3a
         b0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295222; x=1791900022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxIH7tVcaH4/LHoTc1gJIz3XjhP3nLsv7ZMM8u1zMVY=;
        b=nl3S/iQFQnfwcInFGxiSF971XGjnINkW0bbTWJMkc0FN8qOH1yWNX2nCiSgk/zpS+i
         f6zDLAqS+TShON7CrjPrglOqUpdT6wUZmZqOusZHe3hX8kYuZuKn9oaQ3qU/zU7nT5+z
         4LbOd6ZQfiVzXd88H0IecyU6bcwZj+OAaix5vkEnPVTQuldbARRbpRxdvTEquVHqCYdL
         c2piU4AszCbrgOHBvFoQgRJXJKQ1DGHP7kcdSce9VRf3n/k80qN39LAy5JP16jwEREac
         rp5P29xEcflNFfD9nVXglR3CRGpUzuoRcb0HqZyqpUKmGa2PSA5Xgo7c4a/Hb/mdERf6
         RzfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBQOgEl2xnRFBORwbd9PTLsu6v7Honpll0EO/LTziuyaIjC7KkBKicT4NjYPogUEnRtuN3pnrp7bN7ahE=@vger.kernel.org
X-Gm-Message-State: AFuF++nXWUY2Pm1gA1MF9haEJZLWblqviRkDyUIJsj5k5V5FP69UGy+v
	E+mGQVuI/yQxLykim6jssy56n0EEqwclFiBLbrthDDxqOyDaqhMkTDr0
X-Gm-Gg: AYBFou3Oo1ZcO2scQ7xPXXGZTdc20Hv+Uuxqs8mwxeQQHZiZIgF4r+kxS5W/KWT4zky
	6MZ6c3W16XCcvEn3fFNUv/kZOwLxL/FtfbDwwbkmZe8FyWYifm1KYt4MiOizbEmc7t1pN2IBjWB
	W2NSGSABrfwYxEmhxk1sPLpYdi/fZYP6OYB8yTokCbjWqmtdlzuG4ITBtCgf94cJ1d1pELw42h8
	L1KaImLvHL1gqSwnoZUjjbdddFKvEupEQjVWdmSTgFN0McVjXaiK1Yy4OEGeWEIr/eV+961EE2r
	p+mD6sX6fwTlDUgem/Bj5Mzy3wEkpReQWtP5GoXCJUxekEQuDipWPsLYdk9CsFNKDE6ynkCrN5F
	fqG6QIFQctCVe0VuvLDS05BuoSNsiF9iVZZ0hWw99GrrwCpsUAt9+x+y+WgaFswb3UxlalmiAgF
	Z4Wb8s9DlQqaAJDiax5uh9yGq+bDWZPihu+ssPbqCX39MJtdTEhPG12a2cBkfYXQl1YCz03mMWv
	qLRfUaJXflH4s2PUaYDHQ==
X-Received: by 2002:a05:600c:6217:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a027454f31mr206690415e9.0.1791295221292;
        Tue, 06 Oct 2026 07:00:21 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178ca8127sm80577255e9.2.2026.10.06.07.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:00:20 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: KPrateek.Nayak@amd.com,
	Vishal.Badole@amd.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	klaus.kusche@computerix.info,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	peterz@infradead.org,
	platform-driver-x86@vger.kernel.org,
	ricardo.neri@intel.com,
	stable@vger.kernel.org,
	vincent.guittot@linaro.org,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: Re: [PATCH v2] sched/cache: Honor asym packing over cache aware scheduling on hybrid systems
Date: Tue,  6 Oct 2026 16:59:58 +0300
Message-ID: <20261006135959.5709-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <77ceef1e51b895760dc5f6c9cde985a1679545b5.1791224900.git.tim.c.chen@linux.intel.com>
References: <77ceef1e51b895760dc5f6c9cde985a1679545b5.1791224900.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tim,

> +	/*
> +	 * On asym packing domains, if the destination CPU
> +	 * has higher priority than all CPUs in the source group,
> +	 * prioritize asym packing.
> +	 */
> +	if ((env->sd->flags & SD_ASYM_PACKING) &&
> +	    sgs->group_asym_packing)
> +		return false;
> +

I think that check is redundant. group_asym_packing is set by sched_group_asym() and bunch of other stuff,
but sched_group_asym() calls sched_asym() and sched_asym() calls sched_use_asym_prio() that has SD_ASYM_PACKING check
inside of it.

Ah.. Hope I'm not missing something...

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Now, I'm going to grab a cup of tea. And sleep.


