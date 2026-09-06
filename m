Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A149C2512C8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788654436; cv=none; b=NXHedWmh8YYIe2AVt91vwnjcjJ6hKHWPz4j6zD9FBailsJhKlSH/+NLqlDFT+PTXOvvlEE/5VZM+AaqfUmtqY8IGJM+nFn0IBmiXxCdtGbxUwpk+1xKcQ4L71TX6arswbA6/xtMJANLDMIOJYZs6uEKFFNDZUBQ3GeaCmA4jmOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788654436; c=relaxed/simple;
	bh=UXiuy6OsR2gb+WFXn1F9VOFzO2Bh9gCnjSFKJM1COoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UD+L35fWhy/0f8yJxVGIlYxQR9IjajWCaJiLhUx7tlwwmcc/TQjcZdY70Z7Aa00bWZ1Gac/w/28jW9KCAIc8PjwrztF5AOYsN8AF9YXzWmq9MNbW1jOCtJtuqxtl515qks9wH0XJ2wTe5Hrc+bEE09ELHCxwc98uux9AsL4BgHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYLhBU8X; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYLhBU8X"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so21027945e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 17:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788654433; x=1789259233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjrRmLctnXdw4wi60/Lz3WaKwOAhOSgRTDFyPjtld+k=;
        b=oYLhBU8X1NckkxB4lJ9/cbpwtFjG4QlBhJmA6qoMA/fD0CHngC7xNQBsQfuMpartYC
         hWLmHoyVg/bOTF9BC5QyTI44IdL6pI80SrynMgdUbovVLYug18by3MYo+uITItgvVE1m
         K3WMQJBCDfsilT6KeQb97cRNanHl+3IHP+BXh0t6IpujybsB9T9AvJsEaE3rPtB7s9cu
         sGWSGlkzbYE1Ak6LLGx4L2xADF3yPyFuYDBfFZ0U1nAFA3weDm4xzTGL2exQWuD3Y8nX
         k0twQKxMDBxyL0cYg+PtXjiBuG0IPHI16ftLNA1wZWPcyd1fKIqjXzrxgaWokYJzwlna
         ItiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788654433; x=1789259233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjrRmLctnXdw4wi60/Lz3WaKwOAhOSgRTDFyPjtld+k=;
        b=hWxbEoHWQDV636lZAgfson69Sj3BWXiXwKtOpmKzPX1g+6U6JuNC/xO0Hoa2ayBiKJ
         hGDtIL0uqDSewnH0MBNexpoDVWrynPnKtWspf4M2wFkba2TUpRrgZDde0Cm93UxH0AqT
         Zix0cWjPp+HnSVuDY/bZMIjqGeNpL4QI0O/qFhc/c8scGlGYMZppSeJL6xQ+0uz3+kJY
         W05IE8g8sJ/g9cVfVqE7hredaCeWXk7uveXrhvaNtNQkSWYHwKUMs0uEVyDbF4wiYijR
         zka+CPaGe0aZVDGUPI/HzGv4S1t3wXym8bD70/gXnqCCKjDjVHYt1a5OSgZVXvfyjGbv
         oDPw==
X-Forwarded-Encrypted: i=1; AKwUvBySDQ9IZJX23dWJwjFWfPIQbTHilgRcp/HtGpmc8KP1hB0L8NjL+GYGePU70p/ZfOJ7u7H6riJ8irAEpIo=@vger.kernel.org
X-Gm-Message-State: AFuF++ko/1EnKTZ1gRNGmwClmPt8c26JvqUNhs61IEMDOlpONWQiZFxC
	QBVgL3cU8tVEhNCCY8dAY26gfOMi0FfoSExIEXnYYD999369CoDTOaKw5j/LyPbqiNA=
X-Gm-Gg: AYBFou1tEq81GEpgWMJ0aSE7TEXWnY7Q3pp+TDt1P10GrmOm+PdMmrgOVYVIaToj4We
	D+RfP1hWxHY0V8xER/9kp9XPOGXGgLKcLuUEevLPA47jiRhjszpUlnhL1NsYWRwFar/x1lRE1bR
	kjb3hdY0le94ub4G642FRPVX7+eRmSAc+cAMz6fFP+gPYuh1ncLIRsFZAnWZ5qbbG9c529IQvQX
	f1iijBqpOsaPwVpRAUE+u3qC5Wm2P0yl8Y9cIdgPhNM/IHoYuPGQY+t5sQNkb0thoaqMkyFbKAQ
	cYePGI2FjN3q0gOEOVCoxQ7+Dk7YTA7h3nhdMCng5XbPBntPFW/+NUvZe8/NZTVIOf7lSRbsT4w
	RSZvcoqI7kgZxgf0PvCwIxnehMmrFKWkwKdf7XIgOfhYSsRYofgQqin8XlJMV0Bt9YwLlY6kmTh
	hY+5CEzSMjVsXsBoHeYerzJMU5M2ECivNKM+t3eiIENndSL9sy5mj9NANuh6w=
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr311733165e9.0.1788654432616;
        Sat, 05 Sep 2026 17:27:12 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm236791575e9.3.2026.09.05.17.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 17:27:11 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	kvalo@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH v2] wifi: cfg80211: avoid holding rtnl_mutex across all cfg80211_leave() calls
Date: Sun,  6 Sep 2026 03:25:45 +0300
Message-ID: <20260906002657.620076-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903151542.486376-2-omermetekaya0@gmail.com>
References: <20260903151542.486376-2-omermetekaya0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review, Simon! You are correct, the previous v2
had a UAF window between rcu_read_unlock() and rtnl_lock().

v3 fixes this by taking a snapshot of cfg80211_rdev_list under RCU
with get_device() holding a reference on each rdev, preventing freeing
between per-device rtnl acquisitions. After acquiring rtnl per-device,
wiphy.registered is checked (set under rtnl in wiphy_unregister()) to
safely skip any unregistered device.

Changes in v3:
- Replace RCU drop/reacquire pattern with get_device() snapshot
- Add wiphy.registered check after per-device rtnl_lock()
- Add Fixes: f7e60032c661 tag
- Update commit message to describe new approach
 
In-Reply-To: <20260903151542.486376-2-omermetekaya0@gmail.com>

