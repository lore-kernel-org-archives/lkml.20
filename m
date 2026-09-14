Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BF240B6F9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375211; cv=none; b=hhz4NRUJfH7/4tjWx8D/PpPAPTA0I/KuTDTw5krwo5etouvzsZznO5n9yOHXzE6OXAX0cZn4c/0/ZL22q4tEEcPccbmjo7e/ca7OMMQGPPSqGo+8n+jwJAaxCWVUQpPwgARbbdqs7j+zXmqxkXuEyvowL0tQpBCPnS8nxRKFsfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375211; c=relaxed/simple;
	bh=S81+qyFwsfOGmk8DsWBTJ0XHZ5V5GlZfn960Le4gC70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GIBRo9e9PsJe2MD1pUP342t37NzWRRA0VygxAzj0xLSPfNLE/9LBjxcQF1GchJW7cdutPjTBQDSyCgSeRFUMss7yre7FQLI9A9O8yLJPJ/TiKv71bi+x9X0FDYs7pljFvkVXye7yEKdD3dFakWVcJJcN6M1TtulA2ub7ql9BiT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDyqXeFW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDyqXeFW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso726603f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789375203; x=1789980003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S81+qyFwsfOGmk8DsWBTJ0XHZ5V5GlZfn960Le4gC70=;
        b=GDyqXeFWAHi/EZvGcdwEX2+ttDDVdrtQEwFnVG/ntWXvPicZDOt8te1IBXxS3T/888
         pikc3ZNGtAyAmrvjJg/6C0MOMPegekD2ckOWHCaNwbgcNT5M6GSCfQIgHqkG4eTniQRC
         wpr4qqlU2qunEz29TrVQod1Vaz5gjch3Nf8Wk7thLUtaky8Bql+YIBBs+Rdi9g+gUiTr
         +bw1jVBdLUAyApFCkkku4Op5251G1og+knHEdeOUP2UDjztkCO7b4Fu/p3h0aUKrzYG5
         gOCyUGRgkHgJ8uY73r8Yc18V/FQVS4RUEaFtz/Fzv9AoDGX2/4s8CE7o5ddEKVQA73tj
         VdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375203; x=1789980003;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S81+qyFwsfOGmk8DsWBTJ0XHZ5V5GlZfn960Le4gC70=;
        b=BRFkjn93CRsa16j2jvvHsLtjHSAWwoVwAwIhnat36/d/QwT6Z5Z2Np4iDML3qRg8mY
         AD5Z6hyGajYhDjt4LB5F8DE+DPjPlO0ApPs5hATxX0h/Uj2QbKaz2Iovf6NycbAyblUO
         ZyLApwu6q26RUuLoC8BS18dBMHiUHBubRdnaRaGlSLp3o7ZrgDgPr3Dtq94Jwg4fFL0p
         54jRm9VESqpgZX7WO2So+oDY3aLgM+ZIsaQYcv5iYz8j2qSFr4pnI3Odo1SXFjIJsJYf
         X0PCB5UmdwszNjSGlIR869iIU0po+PWEKSkZuhnXlud9y624hf+OWdB8kzu+OxrusMaL
         dUEA==
X-Forwarded-Encrypted: i=1; AKwUvBz0m39BA4cZVLBL2YNtADG1TKPVV/UWUkLnQCj4yX3Q2h78CaT3txB6DpY8fzZD3+oh7Xcf1l9Adj9lYlo=@vger.kernel.org
X-Gm-Message-State: AFuF++k63aPh5xUWOnwFMKSCGqsrItjlHhBnx2DVoi7Jem1XGjKTE/Sr
	A657D9dp3TW4PbDNtSVzTqgzvuLh0eLAeLZYsOfXRCxCDTfugzzVd7Rp
X-Gm-Gg: AYBFou0SkXkkSUx3loYn9dPOx8B/KMjioEO2DRADK2gKBbO9JFakAPTp82bqKR24xlf
	VZNQWgEvhQIUh/0DrDnC+rjHl4hRMWDodE8GXmXqq6LhYgOJfg7aPXNuBKprs0jkSjD2DYUjAbC
	woIdwS1AZ+eZPbI+tEsbpgM8J52CofPLuO9VJzjfwsC7m1eX5VWllOyZygRDPdul+b4keEAG7rf
	sbQSxriLF0aPw2iAGBSDZ5qc3FqxRjTskaiU9xYCUeNf80/LkxMOSFHsSsdJsAAvCmp3yXCX3GF
	sUwt6VloVnM2U3DYIHRro67ggU9TKxgDkTdtRBcuGdM7BrvYyAMzqg151ZXFdFsz9JpJ2U3WP0H
	wAPLd+cwmrcvf1Nir+PV6zLUlI0tf8lbZuLrlXsG7To9cJOWyj87qj4CdVFpRVxT3rbo5/IHVWH
	FkFsL9JCXV0cvT84raMYa9ViNTXoU9zoGv6RqnutDe1EJEgQBOGCZgDT/naFDzzOkCOH1drp5LX
	A778Rw=
X-Received: by 2002:a05:6000:25c3:b0:487:84:96d7 with SMTP id ffacd0b85a97d-48702b3a150mr1472168f8f.53.1789375203284;
        Mon, 14 Sep 2026 01:40:03 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm24221897f8f.34.2026.09.14.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:40:02 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] HID: quiet the keyboard on the Lenovo Yoga Slim 7x Gen 11
Date: Mon, 14 Sep 2026 10:39:54 +0200
Message-ID: <178937519417.10463.3332484043112843827@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063051.4556-1-okerixx@gmail.com>
References: <20260910063051.4556-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jiri,

1/2 of this series is the same patch you applied on the 11th from its
standalone posting (the i2c-hid reset quirk), so only 2/2 is still
needed. Sorry for the overlap - I resent the pair as a series to fix the
build order the robot flagged, before your mail arrived.

Thanks,
Oleg
