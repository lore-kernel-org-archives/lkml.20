Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042503793DC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287312; cv=none; b=KeTLvG5wQsBeydlOwdqjPpl9kNYZuzLqd2jFoUYawRd35QJUydHAbVs8C5EUbTofjhAlBnjyutqXPvWi2u65/nKklVibo60lup57W3+AvwWbx74h/aPliUevTarWLCcW9vOYEDlk6NS6xw1tK+ZvKiyYxb/ymqyjGIRrdkM0EJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287312; c=relaxed/simple;
	bh=cr9hHYMB2tYTAMI1fcibd/WSAHGzMrbP0ig4jEuoGm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgAWUgm4eAMBXTqn7Oc/CEF1yVBAG7TCGDPGUTjA2trwcxJaiFrH1U3Q5HQVR8XQhYTGMEoGA+v8Jo2iccLpu9FHrhY5SwPE1xEhMUzjw/4tGRGMOW+IhPICyXgUWsogm0yEJjJpGiB5UgQighWAovsRn2WfURZt6og+x0I05kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=singe.za.net; spf=pass smtp.mailfrom=white.za.net; dkim=pass (1024-bit key) header.d=singe.za.net header.i=@singe.za.net header.b=okzgZ2nQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=singe.za.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=white.za.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=singe.za.net header.i=@singe.za.net header.b="okzgZ2nQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so5353715e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=singe.za.net; s=google; t=1791287309; x=1791892109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cr9hHYMB2tYTAMI1fcibd/WSAHGzMrbP0ig4jEuoGm4=;
        b=okzgZ2nQbYPqR099Q4PXM0wWIuJ25p1D77w62aowmu9i+iwfD17HjI4rwGg64CK2v0
         zjRGiPNy1mSNIAXd0oUqZ/54hU6njGbNatKLmCOZ3ujMSle34hIkRFvdTQiNF8Pjgo3Q
         b2hWRxSHwt59bstJhsZ8Y32TJnZN6M6u0cHA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287309; x=1791892109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cr9hHYMB2tYTAMI1fcibd/WSAHGzMrbP0ig4jEuoGm4=;
        b=un9evb8sAoyoI8KDQm78dBI7QWcbkmBKyJJYmSAKsvgdOlC3WvZXNsrNGbJQECA9Bd
         msN4p63stmU5+iIUL6VksA1BuZIqXan9CqXjJ9ek9TujWuv4Zv19AFWEmvETzTktJNSY
         O5oA5vMyvmS5r3B7vseX5nRErIoWdwW9poKWRaJdifo+eLLgz0WdMGE43GlDLbMhlz3u
         ec0rmf7mbP6GN3R0fyNxCHA1ZuZX0qPhXIiY4FgbpZryXgPvYHWc/XTrQTb6J96JYX/+
         58ZLb9c4hSyqQBGWStOrTCzF8l1AdcjV2M1Ejl5Ycl0S8Z/c0Rc684+pbcDcq+M0QZfu
         Zy9g==
X-Forwarded-Encrypted: i=1; AKwUvByj4eY2G4gr+852qgDAewUrtFf0hb6MvjcvVLk+K94nfqGwcLsSjpSYQMdtMDl5vEW5MUSf2XFWV+NTtn0=@vger.kernel.org
X-Gm-Message-State: AFuF++lIod+vQJADHZbuQ9akjplVutsIlj3kmKIQFBvLD7ANs30BGj1G
	zW4ZxZHirdGHioyXt9zPp2xiH2xKyKiWhKB73XxOAsJazm9/AXQztKiKUwBTZMpew0U=
X-Gm-Gg: AYBFou0fH4I0F5RsB5NlcEp6rCRV4Wynsnz9OX8tk891YqkeyK5MypCMggIHiqJi44k
	gmI8m9ugGOZHrroAFIorUDu1DG6G+XOWPVW6yZjWA/YwiV5Hbls/adbnubZtjjoK3VSLrhTUNkN
	9OnajgYF/58OiiWUBL0eDV+tdEc1Dhyq7Bf4F1lJnwBj2W2vHgaGLhMJ14oJ3Hi1MeAQg+jGExl
	2hLk/1pxDkMzFjEOyMQipdPTyc9DSeyf/TTsJjw+ChEZrbqH6CuePCfLZP4SsIJPNeE0hda/HvF
	AtPmomrvuVYIoKs0+cZRyI40LsseA9LR0F1QpwZ+KNxntPgvyqI0Iw3xyAcr9V29DGpfHH6c6lO
	NfwRnyNF80LlEBp4/lm6UEIpsG6CncEJI7fqv20rG4SklJIRoV5tnXId41Nxl0dzHCowPQU319r
	Xng8uTb2jPmRPxSuGqz6SkYYNs91Y0K6vG6h+6pPGrx5QxO3ibieBvdBVhZrcvyBok8g/Fm7D7r
	qcyLT0g1gDHDU/XaGTQvljNxJQ=
X-Received: by 2002:a05:600d:82c1:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a17b536decmr21973265e9.7.1791287306355;
        Tue, 06 Oct 2026 04:48:26 -0700 (PDT)
Received: from localhost.localdomain ([102.33.233.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178ca806fsm65783405e9.3.2026.10.06.04.48.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 04:48:25 -0700 (PDT)
From: github@singe.za.net
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	github@singe.za.net
Subject: Re: [PATCH] wifi: cfg80211: allow zero HE OBSS PD offsets
Date: Tue,  6 Oct 2026 13:47:03 +0200
Message-ID: <20261006114703.29021-1-github@singe.za.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <a5f74bb1113b5841a4a5359ba615cc114f41a1cd.camel@sipsolutions.net>
References: <a5f74bb1113b5841a4a5359ba615cc114f41a1cd.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Johannes,

Thanks. I followed up with a hostapd workaround, which Jouni has now applied:

https://git.w1.fi/cgit/hostap/commit/?id=5b156e272a0266ca6be0f394192bad42b0ff176c

Regards,
Dominic
