Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530321;
	b=T/bZYPD0tV3tQrYmu6JONEWY4/NMOPo2nAb7eFa4tltjDdVQEQo2vgGCso6PeN05jmYY
	 Ku0OrUj/5WvoLZMsTCmYepd2lDW0WPmp0KLbZlNNeRJFHtI2+ZdthUaissxAJQHG3Rbzw
	 c+qgAqvN+jDgTYE8d2POeH9QEVO7jzpMnNH/EjL0E54ayzgFRteD2FlKQpBepiTLQrqZm
	 hK+h3QagCDB6egTfkL76N9NjjERxrFx/M51m5mQltm1OSUE8pCwhRXFmRMrMqAzgatkzD
	 W/cTYzn/pgmZHk9/QVpcxng4YTo8srlnrUcHaSH3w/55iF5eKWMvSYLY5NKp0CBBs/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vv/C2NxZZqwyRnHFl0WSTQxRF9vRXgqKEFEZV271evc=;
	b=i5Dkcoe8W1u2Uo0RPmKJWQR7aHylm46ALE9ZcLOR6onfwnsfBwFBBnTSGtoErAU932e/
	 Y3H42zvZZrAzJOdEFGbKv+QNwmt9hlUqBxAthiuk4KppXClVmQk4SYtoZS3RaviKEFFSD
	 B/Tk2LMTreTYsDc752Jhp5W5wDrHXjJvIU/b3/xKfW0SMX+JtiUDSiVxnqpgLU/8Zd3Op
	 UO5uL6wN/MgZqloFmZAtR6qZM1g+0OqX/120QVMiPgIayxYHmqmfhQ7bZThIfNPC4shMz
	 TWcvb6tjApAKBxheLYUScy8kbGirq+jVWx2fEyLJXeMpFPm6qhEkbvbUMT09l106A8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhkboxNu;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB313606B7C8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB313606B7C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhkboxNu
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so4982675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530319; x=1795135119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vv/C2NxZZqwyRnHFl0WSTQxRF9vRXgqKEFEZV271evc=;
        b=bhkboxNuxmmp1xYH7wIWj1A/J2D+PLJUKK+g8dlwdo/33MHBcTqlihZxEcR5UV0Ngi
         hbONhiUTMCCYDAorx2osB6eH4JTDjCG50YhvyC3tUDRdOlp14ScMQoalz1Phgx+xgzFZ
         7yc53jQ+45Pw43Ccpuz3tFvW3/fHVVuHzu/6CB4/czAFBmbRTcM8MoQqM+1lAeJhElKG
         lgrEyMDC9+e8YHilQg2n3H5kwX2vKMpVlpdDtxHi/lljNkBL2It2OgRXgm2N+G5r8I+f
         PdEV/tFxIxXcNGCYgNCoVQso+C64dTDEoboIkd03MO5nhgrWh/nApYUn6vIxqrKbvFoy
         anSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530319; x=1795135119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vv/C2NxZZqwyRnHFl0WSTQxRF9vRXgqKEFEZV271evc=;
        b=uvCmhNCc7OXrgbrkCwgI10nKqIyFY0ZrtLa05cpvn6vQLwQtG0hgEjhYBpMMqfGAy2
         /Capj4eZ5JVAWgIraYgPtCd9S5Kk+TF/rinOZXyhj6YistuxaSESXULGd3j7vrQSS60L
         CkTeUpNS7GW1YwvlyOPEBeyt7T+BAamgbsQtw9xBXoY6J14G68sMZUhroRsdef8Q1XVi
         wv+2qf1KXZNe4dn6JKg2ZTSymXw89fKB+YFbutruLeLWX/VnQvG5N9kqkrM3dn+FXHOV
         qYclMKbKioMzsIgHNAa0RZXwogWBHrdeNwpOF7mcZm66VtvLz2jaNy9rhJCsc9cYhh8J
         33OA==
X-Gm-Message-State: APuU4Z/TPPf/GAhmROxtMcCxtmgc//ioHPrh2Y90x6sZOETzWa3dX1+L
	n72+jKRB6rMHFysPM8K6PcIMbCETSaF1oP9H5td1BThEAcwpek4ei5sgqL7FCGhLnIg=
X-Gm-Gg: AYBFou1ofhGtts26zH+LTX2IPRPcTk13XJbG5F7roR4O9clFZIAvvC6R/kD/pfpmVe+
	oUU6b3w30JRDaLBQcchOd0HfY1Vx7MvhEdfVEx+XAd8y8gGG0PZw4t6K2/R0bPFKV7/4Wpw6xSH
	yQKAbCL9bwFw3Jd6tEv/wbFPxdHQufmkTEYQxxqMJgZLcfaJlTeLZQqeEDm4pYyecJsc+0f0CSP
	dhQHq/CwzQwEOIcIURCqVwXoflk/8Y2i53fmfFoKVGfILf+7XGAlrZfw5a8hdO+vFeSjrc6uxbJ
	ONkooA0t1MAkOSeh6btGoxYFZLgNOM8r/yYnv8Hc8PDZ+syjtaKQQSmaaS9evIGpgBliamcd8NU
	5lO3214uRQw5hSN+vLh/qH15ASK9PnR4Mtp7rdhWE38tpqGwCpkyu7SLL0tVsm+bSOURI9Az2m8
	o0yrOkSJnExNpyLaBKsLKKmzfS9fkGUl5OAKg5dTd+p/ld3ORSm0uXDzqHlfwybv99s6nq9lP35
	3jpppIHVEkrdvGU0VQ7XzAk99zPN1vH8T7LSd+U7hDLtywFm38pzMopdsygCBRgCmdVcNzAfmPH
	z4DtvMy9d9eUaygGhgea9WHS7cteCRazHGPZOl2ApJ4VPp9IVkd7RhSvqClWJg3v1ETk656UzsU
	Nv4wCV+vVttBFMf1+yxLni2H66O3+fMa7nH1e3LOfr8XauGHx9QypiaRLKKUtC/sHN95JZhBGNf
	WWpYt0VH6mklGx8EoG
X-Received: by 2002:a05:600d:11:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4bb55a507a1mr14780285e9.17.1794530319305;
        Thu, 12 Nov 2026 16:38:39 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f2c40sm3786595e9.2.2026.11.12.16.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:38 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: srini@kernel.org,
	mathieu.dubois-briand@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	rafal@milecki.pl
Subject: Re: [PATCH] nvmem: layouts: fixed-layout: Apply mac-base consumer offsets
Date: Fri, 13 Nov 2026 00:38:38 +0000
Message-ID: <20261113003838.3671676-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010125947.176459-1-ghahramani.navid@gmail.com>
References: <20261010125947.176459-1-ghahramani.navid@gmail.com>
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

Hi,

Please drop this patch. I wrote it for the ZTE ZXHN H3600 board, which
will now take its LAN and WAN addresses from two plain cells instead,
so nothing in mainline needs it right now.

Best regards,
Navid
