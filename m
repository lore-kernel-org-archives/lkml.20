Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903805;
	b=lT5MPobRn9j0jKR5h7EmwOmUnRuhxnn/wW1x+zi1fSphsewZGfKLs6S0FXnrH9rf9NRA
	 1tzxDdn8KcsmbkacjoBpnpr+MoO5JhSL2fym1dd/loOr4lymK3CnE7+zrLKKDpvZRuk2m
	 3zqM1pXJSuqvAonLzQQTm/e0AhvAIQtdQz6FybmVjrhqOkA0UydSzNpborsFAoz5cDUi6
	 G3L3aWMRoWqMKNl3rbhgI1EtMELs0ngKwl84sXbsP80Xc2UDJ4ooldbR+4p3GC6SvEyKj
	 MR2InEC970j96M3daapYA//facOODhQJwpIG9EccVigTj/iyQRL4GqFNw31ZwI6EuqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LT4ku/JNKyZWGL3WmWvhNxWBvjdOBJG3rnFdkcbfP+w=;
	b=zNwToT6+uRdhhCWb5BzwZYNxL6FjfM0+Fdgn5jSIdVQBHMBomKdlAgQk1nQeKLq2fQdi
	 A/GYE+0A2Et8gFx7zngeRNxWe+FSyCNS0Z86CiECm3nWVsRYtjxdzi+E/3H4XrV+lRuU5
	 2ZRYUionZbLhx1IqCxoM0f0JkMwuihD5RnBnHf92NEW5vXzCvNZlgNyL0DZrZgL9HtmnN
	 zu3985zczvk3ZvaflcsfiKMJ2Dr7gHBOOcbkHAWas2Kepwm2Pi6MUHnHkukLq6wGJlFgb
	 EVM+f3m7R/f0ax3KKZppQd1dWNRqrO4ttZA2D3dVMQOmtD46+Ol0CTa6OMbWEwXjK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeSCLzZP;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE18606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE18606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeSCLzZP
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so19265395e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793903803; x=1794508603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LT4ku/JNKyZWGL3WmWvhNxWBvjdOBJG3rnFdkcbfP+w=;
        b=VeSCLzZP3aTIQS713PJP2yh/PonILJQ843gbmphDFqd3ukdr+yYrTTT44g6/0KvH9U
         yOwsLH9FqsTpSAYcmAh3w1jL9wFnkHCOBr/mguNsbiLtO3DDvAoNJeKnu9MYljTuaXHk
         SldG9Ts1z0luPNcZ4TtcuKLNFoHAjLESrhXTcffB8guwtzeL4EUzUcB+ePZtc/6BlEnb
         u+yxa3u2BUT/ORtUhVgMgT/W+3NsJXgf1mOK02x+pXnJB9XSZCaUhKlMnkDxYRBS72G0
         KML0kDFgLxtmETnnrebj6/jzDBUBvNLtYUYhuIjxAhtL3LX5IT0xQwknozYPyuIyo1It
         0cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793903803; x=1794508603;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LT4ku/JNKyZWGL3WmWvhNxWBvjdOBJG3rnFdkcbfP+w=;
        b=vrmOMwOOo4kp0VLcCfZUw/S38wZ+U8fQ61QXQ2OBRVuSI6NvDkJOcByY+/ZYOt/oid
         StKgzAGVC1JSgUw0MOjcLcruWRrW7FylaTFB4pzaIHFDUemAJlIP8JVd1ihLLp+RRKuy
         nlh+Jz8mH8mX4tyA9/SCl8ne42Q6CGb9xzFFaSvEGdPBr0twvpWzMvpwTHPuihbtdYXx
         EJrhkVspzB5rJz1vaSHs95Z6YhLs/P2jR65Wu6DYzVRW1JGiye3kiovvroeQcOO7DNuO
         CTKdvvve2fbrHazyV7ZnbVrKIfLcphw1empk3x5mx0pk8lR9Eyifsu0L4jcGg/ZGFOzT
         B3dA==
X-Forwarded-Encrypted: i=1; AKwUvByEEsTqRj0qjcuj5piPeESByQo0bp1gGdZ5RDhHo79pT2qsGpE1reYf+rnr7F6WX0bJOCDCswe7gGCLhK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a88RelHijQc8dqUAYCoq/rPEwi05IRWmpvEddoXkn1+ebXwLK
	LkWHGc1IwzM9VqLbQfEp9UoKKc3NgSMw1txUMC5Vo8MvQHaHLkxo8Qem6h/fngAX
X-Gm-Gg: AYBFou1iwQsz1po68/A4sz2GZt+3oLIvYVkJor67onnFvfzrUWUWkAif8mpSCj4NgHb
	VMKp/2s+TC+pC/iaLzCQwlCYcNxytmHl72DFDm3aU8tSl4dG+aH9iei9pP4iFnqDw4xzRw+WBmA
	3OVDfHDGSReXpIg21GyHQrHT+bckEx/00pn7ORyhOrmKR/MOynAXt/bXjJDGx2bLoZtSfVY0KQA
	BMbEGWYCfoup4rL1eAajwk3otYCtSQ67YM8qTfllgSuUXEtH011wjnQWVdrQrYjqrvem368o310
	d7Q6sqxRGzuZFBULl6HJxbLpHEnoagd4Ek77VPxixm5an8K8aCw34W4PXovOcM2K6N0lM6Czfjy
	aWFpojPnE5SZpHee6IYNXVPQAXu3Ywyugyeeilh7My05+ajVforyhGoYt5PCa+uefVUaDiy2dE+
	R+H5BCBIdQRpHPO1KFjIIOdBNnPAF59oJw30uZjJxAR4Eza66Luu3yZLafqTVYtlcT14Gqg5fI0
	oTL3y0W1wj8THL1ROzVr9GQ2nW8HyNMSukDKPhWbXsksQfruzRyMQtsoL06K/eujf+8cC4NdoTa
	pXB9GyiLblEXFk4iOQ2xY3t3RZ/09W9ouA==
X-Received: by 2002:a05:600c:1c0f:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4ac1709a7bdmr458056205e9.12.1793903803605;
        Thu, 05 Nov 2026 10:36:43 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae72dsm136068355e9.3.2026.11.05.10.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:36:42 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Oarora Etimis <oaroraetimis@gmail.com>
Subject: Re: [PATCH 2/2] drm/vkms: Use drm_dev_unplug() for ConfigFS device removal
Date: Thu,  5 Nov 2026 18:36:37 +0000
Message-ID: <20261105183637.188094-1-oaroraetimis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031225901.3200167-2-sebastian.wick@redhat.com>
References: <20261031225901.3200167-1-sebastian.wick@redhat.com> <20261031225901.3200167-2-sebastian.wick@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

Thank you,
Oarora Etimis
