Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048221;
	b=nHJ14Py2s6O+gBUy5nvB5clnX0kTMw9r3bl2Bw7HUXiUd1A9V0Pr4bEr3hcF6OU1WSbx
	 3+omsJ0zCKDCD0FnloBWl4FFqBykalAd46GDh+9iwjfV/FXG4QZeUM3X07GyGBoi4h64x
	 BKWLwrf2l8fAq6P92vIBW4pY4t8E+F2Y5XXMDvk9+auZkbdxaN41pFSlb8HMZnl1aWGne
	 c6v+SkEyVb6E0sUFjWlV2T8CfStuIgHV14Uoul4x2AfnniJX+huJfhPC+KQPmKawcRZ9i
	 uMqQDdTLbMe+1YKYXDfW/9SlFx9hegwutjLv5LPDiXsbnqZgWyOOKs+VQ5+JyGV+pog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048221;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zFo4l7j16ZsDQEUF+stMjRBTlBJ8Z+3F5xTug7lrKcA=;
	b=HlXRR0DJ8UqbStRJWAgHlG98kA1WHbyoYngYl9IGVLy4ZLe3vHmkXazKyuf8Juz6fSw/
	 eRSE3E+4FqKqikTSBTyXmC0GcOKQtBGagHQrBfEHq9XZYcNgLTRj4TgzRUMSLx/8PXGJv
	 LnblV8VmoOKIGcD06jj+eLQvXHpUpeIw8SbtbRHtAfDXizDv1mbDc0lTzWiqrBSWj5oiq
	 QoQW128KR6hjMqNHCa/d/UrSnTXynGsFby6AOd5piKuoCqZ/c9wClC2VSjm0ANxU89fbu
	 Cnx/b4Qm7oGYQk9YPVuQOhrpRaqxv4zmZ9l2f0jHYMT2WMQGHjJt1z9T8Qq+G9D0IoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hackers.camp;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616B606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C616B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a73fdd2966so1223745e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048219; x=1793653019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFo4l7j16ZsDQEUF+stMjRBTlBJ8Z+3F5xTug7lrKcA=;
        b=qZRHm2aPOAdpxIaWtObmP3b/xIm4+jwwpmxrHnMo2nNt1nQqHS33NqaNjLPKVV11zr
         kl+4vsGZvMgq4i8F5oNlqg7QI/XZXSDWmBzNwuU6fRMfW4+4+yGFpgIFCms+7TK2Uo0/
         tyiTsHUmC4Wu8Auf+FXKmz6ejSTRN93Qy3iq5klPueS1+A651UM2zM2FG4RZi13Z/fPe
         cez7QSQOruoSrvzw6AqEe7moRHcFhJqLrPgP7Da97FatU1aAP4WC5J0k4YlY9HOESoSc
         dRzXWzo02H/2NtnZcKQAgRSfsXRmpJFzxrKbJLj5UML2CQRqrfh5SMY3rftxbXj9dQVz
         yifw==
X-Forwarded-Encrypted: i=1; AKwUvBwO1YWPL69H2K61rh2tbtxXqWwSjrSxJLAxl6xvrHjCbJsRKgqYVbO5BqsSVepxQfTf/B1Mb/0wxyXbQHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLsPfy/fv6chnVV7h6DoqWezj5c8bRIbvImpnRL81+aBLROOsr
	S99pPqPaTW+CrvnYoHZjDjcnSZnuI4fGoHjY5Hz3j5LWMdDoxQwxQ9v4
X-Gm-Gg: AYBFou2PtLGTqyYRMaabVdaqEKpzHkLppR3B4l0Ef7QOkBnLptQ7T3BGoNv6TNU6jhT
	R49xx8kFaQPOG8zqdFBvVOI9Qtcxe8m4mAuzq0aaOGHoJSS9PxgTq61nsx4wQIRePvifUPc4Qbg
	HMguKplwK4d7Ih19Y9/SMwJuYIExkTOAIe8ddlPVp/M2MLRmsJ+EkBU5GfmKqv6CUWJb2AdDFwo
	c6utErFiGQmVeWosG/67fU+XmPyIBr0Zf6EChybWh6arE7ug0Uq6kr+AgnwEJnsSS5aCIFmKE7K
	L0nBUP6Sf1KWUtbj7LxepSfxRIdai9YjeSKxLbCiNdfrbUreSj3owH2OF+05PYdEeXkwdCxtEGh
	Oz5RThcPzOiAv9Qga4qCLvQk4LgFIKogbV6OImX7oNssrJbY7Igagr1yzlX9Sb0B+oX+eNnzLNW
	heK79B/6yxGHOAB47phGQBo4fauhLt4+Qp3Q/bSUmOoDe4sE4Ogb0XYkU9wD0OGugvsov25+N56
	Md0kIbmXrwlbm6iZs6dzGjzvUWSAW0tASNVMwE5QFW09EUXI03ghYwHAspAEtzX5iw8Fr5rWi+k
	jvl9DOi37hjwawPt7DGZcJ9w1QnUgqShwljaUDA=
X-Received: by 2002:adf:fe50:0:b0:48b:58e:6cb7 with SMTP id ffacd0b85a97d-48e3eb91422mr11908114f8f.6.1793048219015;
        Mon, 26 Oct 2026 13:56:59 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48fasm18401915f8f.31.2026.10.26.13.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:56:58 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: jack@suse.cz
Cc: brauner@kernel.org,
	willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aurelien.desbrieres@gmail.com
Subject: Re: mmb_sync: b_mmb NULL window races mmb_mark_buffer_dirty
Date: Mon, 26 Oct 2026 21:56:57 +0100
Message-ID: <20261026205657.88074-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <q472nkbfcfdumbxm3cebfnnmueqyl6uhhnper5t6e2cxajpvtu@7prjjo7k6ia3>
References: <q472nkbfcfdumbxm3cebfnnmueqyl6uhhnper5t6e2cxajpvtu@7prjjo7k6ia3>
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

On Mon 26-10-26 14:08:12, Jan Kara wrote:
> Well, yes, mmb code is all built on the assumption that each buffer has at
> most one inode with which it can be tracked. If the filesystem tries to
> attach it to more than one inode, all bets are off and we give no
> guarantees what happens. I guess we should add an assertion to
> mmb_mark_buffer_dirty() for that to warn about buggy filesystem code early.
>
> So what you did - handling shared buffers separately - is the right fix for
> the problem you were hitting.

Thanks, that settles it: one buffer, one mmb, and our fix stands.

The assertion in mmb_mark_buffer_dirty() I can send, if you want it
from here: a WARN_ON_ONCE on bh->b_mmb set to another mmb, before the
NULL check. We still have the module that attached shared buffers to
several inodes, so the warning can be shown firing on the same
generic/241 run that corrupted the list.

Aurelien
