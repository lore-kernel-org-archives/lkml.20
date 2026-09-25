Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB44BE42A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349012; cv=none; b=UnZv/zJ0iebf9CP3oJzI34n3t4ceA4iDhW2on/61n1jDyJ4BnWdIy8iN6c8uVFt8yC0ZvxkShdpaGDyy4aqbw4j1cfWtPOqKzfX5+zGTLsazK1DIWgnqmStkdJjYL/jKfIuSAb6On9mCQhFN476NXQG+PqiiBW0kpT+zV1cj8YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349012; c=relaxed/simple;
	bh=9cCuvtffogqWFceb2/RPE6mHCW/Fr+oXKNH0JoB26i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g5qu3EXfxuHCbxC/vs0SRwWX9NiFdBkQJSeu14IaToBJ6g2XhG7wTTUyC6RngTPRgjNvoq69sdV7/QBR/PX13UP6g8yvasMCwA4U54ki01Pny/IGbTU7uSKrwLWageXXQE7OzA63bnCjpy6B/0FJSNWmeuK3vKQxD3kQRJ8FVBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXxPJgF2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXxPJgF2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso7551205e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790348995; x=1790953795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cCuvtffogqWFceb2/RPE6mHCW/Fr+oXKNH0JoB26i0=;
        b=kXxPJgF293I1qtxYBpYK0LbrWdgWSRe7gaHTDTM6drj0pJFl27bBTOKf9RX480FUMN
         Uedrbt0Xp+ihyvyL8ijeWGgzeQHfYKzH7GwapRVGebx2HR5rdm2lBk73hr/iTBqB61PE
         fKVmMBeQqDZrX44hoy+xwm7fVM/445m3YNghiBG6vWQEMugVgrYI+E1f3zmxB+Oaigh0
         JLFtqPxsw3uLXpl+i3xJdmdimsQFjBG9I0AnVL8Ng5aSb7QFNRP6pYt4jaa/liOs+tgg
         tH/ICu8aDdcmOFlAD8fQ12Iv17nBC0O3zWPK4uqTLPe3Xe2PxXfCJA4uV/HbuKKduTIA
         RvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348995; x=1790953795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cCuvtffogqWFceb2/RPE6mHCW/Fr+oXKNH0JoB26i0=;
        b=ij+oKHUSr+i9+mIY51bz+OOi56xVmZgReDaIxFn34E3F3z9rZx3vlEvqTjpfdvCkbh
         cuBxjA+pmiv1yq0qJrssmYD/InFKV9CEcxvRcWRLGtjX9zcl3O+3bYepiB7YbQ4hOrYK
         iU+XngqcoFA46SnAuU1AJy04MQ+iT/4hDvnaxQSoUqNGeaiSRt9I+lW/mjOcognC9fAf
         LplnQwA/pNAwg0hzcWNTscMcdNnbU1Kg7GbzlIkeLrng0AO9P0Qfj+8PelKNJYitVFw6
         iap0W9cVvxVhshkbBwQW4SCzcBMOPqLNQP/MTPb1xKphzB8Ah0wdrBnKk319gmBJcvhU
         3XGg==
X-Forwarded-Encrypted: i=1; AKwUvBzruxM/ZrFHGqy4KQRpwJ8vt5AF/3wEbTtcf1sbmyBYvUD/7azRqwYDP/JbjaxLNbcWEBl4k5Os4YLvvtU=@vger.kernel.org
X-Gm-Message-State: AFuF++kjgxHy06kfCHyKxJHdGMAXGHso0tvfdGTGgs+jTnDJSTcSkj1O
	U0LypKg0j0lhMj06UGXsd5IeRj9iRcjp5nxT18Cnnsb5HydNz95ToRw33FiwUv0=
X-Gm-Gg: AYBFou3w6SR5zM0QOp4NXN0muTrZMWHwahOZr1KEv5KmsdB34piF2XL+Oy70victJBr
	MboM/a6bjqQTscB3d8bBrzun2yAy+J91YJVe/mqloAMNcFlJ+uWbaM9YBkJKdEGrOO1ZQZMw9k9
	Yc4uwIYnbyuQuPppaNlD2pGsmU/vcNGvs2idOJXVeEqxcngkdE21hhRN6xYfnCjzAObmrm+BA8O
	eh6JANc6HIKqxVQ6HSJF2UP34bqF+cAX4k7gjcAqOUegzS2HsABFRfDY87fFizSsGFo4bBx19F5
	LXYjqIOGzV70qT84qlcmmEsp7d8/MtnMsdbgSRokRyneiSlF0WWs2RydCJ8V+RKHNklg8jiozAO
	5P3Wd/G6Pa+7eq8S0pqzE5bWnwpmUmcRHNgBu3P1oJj+0H1p1g4Xi3VRefm214ADpnJ5e1rrX1x
	e2CF786RyAYhrIAaPUD6qVe0bmfZ7j/I/U41yi+XLZsO3xXUAEEdOyEODo2XztDyISbLfOPu6/T
	4P4We4wPioVGXuoLEUoYfmUncK2RIkS4+wSOEHGEHA69+Mvg2ZnoGXCcw==
X-Received: by 2002:a05:600c:8718:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-49fe7bba7e7mr98053885e9.25.1790348995166;
        Fri, 25 Sep 2026 08:09:55 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm8393125f8f.3.2026.09.25.08.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:09:54 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: Markus.Elfring@web.de
Cc: x86@kernel.org,
	bp@alien8.de,
	daniel@quora.org,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	mingo@redhat.com,
	jwiesner@suse.de,
	kees@kernel.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] x86/hpet: Use common error handling code in hpet_create_irq_domain()
Date: Fri, 25 Sep 2026 18:09:48 +0300
Message-ID: <20260925150949.4500-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5c9b0231-5100-4668-a33e-ccb330d30c65@web.de>
References: <5c9b0231-5100-4668-a33e-ccb330d30c65@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Markus,

Thanks for the patch.

While consolidating the error paths using gotos can sometimes provide better simplicity and readability in codes, the implicit fall-through from `free_fwnode` label straight into `free_info` feels a bit error-prone for future maintenance.

If someone later modifies the code and uses these labels, it could lead to unintended side effects or a double-free error. Although the syntax of the original code blocks involves repetition, it is readable and safe.

Personally, I believe the original code is cleaner and less risky to maintain in the long run.

Sincerely,
Habil Eren Türker <habilerenturker@hotmail.com>
