Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414702;
	b=LQ+vz8RCv2CK00ACmuJlUax8M3SjtE21Hr0nr1biSSTeoloR3ZycB/Pc3izurwJcQurg
	 VM1HzFjQ9tOAaUEv/Wv1QTg1ffT6b3dwL/3M0qZLkuUin9mw5fzmoxepsAtajtE9GDxxl
	 4im/xroLI9atwqu1CeAaQJ1xniuC82yehD1DYpcD23ERp/xK5ehdgU7vA9ZVtK0VfdWbo
	 ySvGnD9+SZcp7iyW4TXX6AHSOLpC4Eiv6Zs2xZCHrQdqdhfxsfRMSMdD0tyl6DvYqP3y8
	 Osh0uWhSsOabcg1ourQnQvYnt7RGwAvuvZnUaZ3awImmZDQpTCfBfrSZQETILm/N/RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mVXVpcIxf04fTtGzwVKXj/X6mhkeKnV3VwdMgeKl5U8=;
	b=RfYMPQJaLN8TAFPIEtD7/1hKylKvGHEYZUlWEsMYYEluRqZ67FdFbp6LNXCAklhtpU5L
	 nUgeo/Ws5GZiKzEl423UvglY//EG9t0uzYTUW6c9aeS7nTNPUSreYtLY8vipx9kHQnARc
	 St1ggmd4RWyHlMaPDTTNBVQkRAVk0tYLUiaSs4ZYTyYlRcQDBRvKLDtq6O+XiS9DWrbTm
	 +PK7j3+4OIyw9FAVeYveJfm6O8V5G0FRLQc6IuCB43WXDCA/EPglXKnVIICrml9l7634Q
	 Ek6eCqdkH3VUElrwoANc72Fb+pG78sOdLxJdl6UoLWtBbJHn/3cMx89Efqst+m+hQFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fj8HxgoM;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF46606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF46606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fj8HxgoM
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so939852c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414701; x=1795019501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVXVpcIxf04fTtGzwVKXj/X6mhkeKnV3VwdMgeKl5U8=;
        b=fj8HxgoMlKQajGCvS7xA0Yv2Ryc56KHF6KQdQ37bFGtOKK/GIbjJDeVeP+oIXDM2q4
         vF+E3csA/VV3PGyO423TQAY2ZT0bwGF4+GzD6vSj4tGuFcoVWt7/Uv2udlxyc+79G2BB
         z1sogktN+wBrp5b/ZaVGJWB5Hokg0g8ilCu5SIo4Pe1JPOpy+bA6RE2ysR/k7MVxMczY
         4D1FNMSXlB7JWBA5h8KEE+k/YJPiUenRNoI6+H0eKUYzpMkS6jxr8YbIASoRk8BkLnMA
         qgLO5+obMVyU1Atoj3Sg7fOwpSjLvc2CD70tXXJc2lKBRWG5IQ94RYlNC2omlyYg91vm
         u8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414701; x=1795019501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVXVpcIxf04fTtGzwVKXj/X6mhkeKnV3VwdMgeKl5U8=;
        b=nKPQY0gZFs/U9xq0V+gcvYrisVsCxp3CxSOAhk0DDW8NKD2tACxObdOKbrQoLbXRSN
         Pz82I94uAAsvfalOLevbCJaC7CoskVSOQsn1v65XU/15eIh9rdDe5hNXwPqgUklBdyqI
         UMZUy2y9Kbo6EFjWA8TxbGi1d/EMmZfzHLx4KATAu097bEpcxNGs2yuXMtreHzS5t4+e
         O1OvAPy7XSUO4H2KLKZRTAtoYmUnlZNYagfYfoKeWM+3HGynKG8zlXnPuUFdUwLhLcsr
         WkAVZKmiCOh7hAEPElvb02hGW3k/d5ETdcTlCTAUMQ9gv+vJQidAxCl07GhEBoQiNtHc
         GVxQ==
X-Forwarded-Encrypted: i=1; AL+hErGAVSir4QMPowsGFftpcsiJaFLyJeceLPXgRK312ZkU7QRRvUmbgHQsPxtjr95rjX58O1WByyn9d+bVqVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qddfI32wsTOYsbg7Hs5a+cmYz32uud/P21wgfuIusozLFQCgX
	kjdHez8DGYJFVDI3iH1x0j5ga1RvvHV5ItkOc6sYxff6hG8xFcDf18kH
X-Gm-Gg: AYBFou1kkyBXEAJTe/T752AYxD661cAW0EGhO9SQMty2jY9UXf4x5G+7Sa0YvOeY0a9
	Ed4fk5URZvWaYFn1W4H40sMSjQNLSqFUx4/rOCA/BJ/56VOUoppzRPPxxlhUXatXZ4NwqyM0bVR
	THbDGDZ4yCMLDlM9fYSLgixMHWziK/BIL5IKao3Vccwzr90yhU6kdWn4GApcUKCkZTWQxB7OIra
	NHaruWBlPPuCb8pubv0sl6EIPyADPJemom+j2MQGJhz7BF+7EDbAFyghm+E1GKx+r9+yg0VyvUY
	LuC9xWdbFN4eX4AcppgTKoS2TXyGVEwkM3tt7jR+BZQy60S4QXqelhqlff7zn9i8swAC6XTLn3/
	p5ifWrl9yPKhlhQzoEBtSN1HaSpqxVZRXFNtm4TEueCjnxZ46FJMr8O3jusOS9IIJnvHI8M5Dvy
	NjeQrA1eXYc9X39eSbamwcWtI12OikOwqGsDKfyZqFYDkZ2QXjnTlzsK3qC9+Ws7TBipX/+Epdj
	ccBtwpM/f2ZpRfdymnR+lRqg/Nl970nh5VRNrw7sSQbgQJ4uMfkI8lSn1fGz3D+uvho7dKqgFZG
	R8bcMt3OFXnDYazhaOJFo9c3T4buR+lsUnOPcSQui+46/TFtK6UzbF+y+f56y1CBljVl4JzBeDz
	hSB47lBlVmOC0+HaePVoCxqwLnF0=
X-Received: by 2002:a05:7022:7e09:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b3c0366cafmr3066679c88.46.1794414700262;
        Wed, 11 Nov 2026 08:31:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1808:a1a7:f209:e018])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm23661200c88.5.2026.11.11.08.31.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 08:31:39 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/amdgpu: fix kernel-doc in amdgpu_ualink.c
Date: Wed, 11 Nov 2026 22:01:23 +0530
Message-ID: <20261111163131.25965-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <CADnq5_N7zDDuE-S6Jyg7q706H3SW6WuM4eOTBcEU90boYJG=PA@mail.gmail.com>
References: <CADnq5_N7zDDuE-S6Jyg7q706H3SW6WuM4eOTBcEU90boYJG=PA@mail.gmail.com>
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

On Wed, Nov 11, 2026 at 11:21 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> for patch 1.  I'm skipping patch 2 because I find str_enable_disable()
> harder to understand and just as long to write as the current code.

Thanks for the review, Alex. For what it's worth, the helpers were meant to
keep these strings consistent across the tree, but it's your driver and
your call, so consider patch 2 dropped. Thanks! Have a nice day ahead.

Aryan
