Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050240;
	b=N5AUG3x9+NwSA1K+ScNRHw+/XyaCg3fdHJKh5n/MKsWyea7s4vhjs4WElT3/ftiKi0Y8
	 HFQ5KgFHx6uJLqAjRH3vDxrczMk1r9sGBkL+DtOWfvYLU47VC831TVuy1IL6dQaQpWngV
	 XFAHFaJWrti6VMLZN2RuwiOhx1Og3V4bfwgA0muhcYEAKFHz28rHyqC6P8ATQLnNNV6Vx
	 X1zIxjO1O3B/TngqoJwdSj8CW+hnccnxH0lOBajMD4sjrbpcEiKZF6v0I7KNiN9/YYVZZ
	 oTESHRPI/q9Jxe/x3aUFkz0SZ+FFHI1X8t3bq4ZH2ra57sUJwYzXIf+kAbd4p4+Rc1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F+/IfPhG4os6D6vXxpVvbJFaEOwonQLN/tF2+VzMsH4=;
	b=FOeFs534D3oQCn6r389cfMkixRwL6QDScEB4X9O/Ld3MYTHhcxJkEQHXE0iFu1M50j2F
	 g5R6RDBOPhOf3kgECvTeIoEkG2mqgqlVWyzelqvmTAoV14oW7xZlxldQQhAn/0fSU6tP7
	 Z26eXI7IT6wNt1JSzNJyvVXuxnaYErOMlPt1JXkQImFvKwCozuQMVgd/UQxES6hMs8UFx
	 CpLzMqq048ePEoG9hsK6z9rfnm0NL6xNwe1r8XlU+/sxX0I9+5HfeqqQ1bwzl0B786BZY
	 GxsIdXQ2WAeyXdj49foBCt8MdJUN12F5j2l4XC2DNZ2ae0T8O3U0uDsA8DoEsSGtWXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RUk/JZAd";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5094606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5094606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUk/JZAd
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b2513decc3so900655c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794050239; x=1794655039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+/IfPhG4os6D6vXxpVvbJFaEOwonQLN/tF2+VzMsH4=;
        b=RUk/JZAdGMZQSXUFKekw43JQ1xkMUp76hSL9vKLpWnel1mRAXbbN4QGp/oHpU5AXZB
         0MCfPvVeZAaZP9oIHK9JZ8oVywCCGkPVzR3sGtGJ8E5ZjxFauXqmYdiZc3rd8AclEvt8
         QzVHwGXgapfIoYEWoM3mvACM1WIkuvS9jAjDBZp1EubGM78cGT8BKc8WbtThEIAOhei+
         8Vjl+tzMHeZe14/XlvNjFzxUg8mJ4F5fNGG5lUOrI2GpMhOr/kmvbcpt/XUj7n6K/ayA
         K9QaXjLhh9V7pzkp3xWn+Qf34TxLL+KpFCyWPqwPPlI1WZjcC2peHR1BiJhbzvvef5Su
         KMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794050239; x=1794655039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+/IfPhG4os6D6vXxpVvbJFaEOwonQLN/tF2+VzMsH4=;
        b=pPiC/T/xBBVpnY9Iq7nZZUi9m/1M2jFdfBtO41CHfRgUsmASqpAu7CcEFuFS2mLje4
         R4ayUcZzPVHRct/QzAymM/RolRf0DM0ULbCSWZmTLoPp1r/UT1XiDhDrvgcEpQziupS0
         KERlT7dUKUT5pT40O9TcBzyG4XOAtsD4yzjlpZVYOerCZphpnmf7cPFlhfV0c1aSUPM+
         2YG561Khl5qHtaVY9PYFl7mb/nhAgUffS7oYNf6RE2VaZ9czoY0bxLFsLMnxkxeOvYC9
         eeQmwR+8HV1/TIP2oRG+JtMYimT1jTxbulSUHxIaq4wFdQ/MenKe+j/1h6eLLX+RVU78
         NXfA==
X-Forwarded-Encrypted: i=1; AKwUvBzyNXHlsI+egromZYmodnl8vXi6Hz/xzVXRDPwR19Pncid87auxfsOz5Ad/eS+pfIJgfRU0NgVb3zxgw5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9++KIm/oXgJvwz734FNv4PkjqHxVjy2ZNVMTNjlmpaD/ABZNxf
	ju95McpvRyP5tMOtQUsMLh2he88T2Wg80lj9hCWqHWQ4/CLEovyVBWOb
X-Gm-Gg: AYBFou3iGyNccPkT3u+ZAwdmjntxsaKPIFnNZkuu080g5QtsY0PIVIubfdXchfHe8Mh
	WCmwEyN7OsXga+g4rFjZ2j7DiQ778oKPiGd1G70l2suGCHCQXXAdRv0JxmddUpaZchYhU94uoTh
	J1CNLoE2kJsp1ESFiGcNxw950dUWy3G6acDtacwizI5dlDG0J6GmGbT9OaDWqeG1ajbljZH1PSO
	ZS/El4CQMX4ICjls44bzD+L2ZpttzAYjsSvv1l9HX0xMcGujwzzY9BNlfDi/Ie39Kt1RXr0GKvr
	CEp5qXZNjVU+gRfiJHXiMUKn30rW5J+oYf+bUOA8GdT/HGmuSGSUXt8yuVhzsO65s1MyqIpO4sy
	KVTzQN0K9P0jLeQEbD0QrJMe5ZjRmUxpJkS7Zq2LKXw/krS5sgfa602zr6HNAW7tYhB0vq2+B4l
	1S7/Vd4L78dbe2mARWoPP4YmzXSGrZwDRIcSfkM5CQFk+MlHRBMI5QXdYeTxJPJ4Qy3XN5AZ+uZ
	ZF212oKC3DQjs1Qh4jMvH2ve6IHU+t2OG6gh6CavKygKLJpez5raHG2d8PMMMqz9oz6yYiNJA+7
	LrG+CEEerV1xlJEH0pGM+kqJDd0FKHJnsb9Icx5BuIHaKxbtY0YUGM2aOJs2Re95W1lYdGSUcqO
	OMQkAlrla0XlJtsbs5FKgXK6RBe7rR0s6WAjIWD+Gc5ycwlJkxdKu+jUMWBia291th0AyoAo6yu
	ZZGMg7katnz+w72HxD7qnBlp1BnVV99uVRrhCeAEyLlg==
X-Received: by 2002:a05:7022:ea8c:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1b25d3058c6mr6660822c88.8.1794050238640;
        Sat, 07 Nov 2026 03:17:18 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fd0000sm13284120eec.21.2026.11.07.03.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:17:18 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 0/2] iio: proximity: sx9310/sx9360: reject unsupported hardware gain values
Date: Sat,  7 Nov 2026 16:47:02 +0530
Message-ID: <20261107111710.442318-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sx9310_write_gain() and sx9360_write_gain() accept any integer and
squeeze ilog2() of it into the register field. Values other than the
advertised 1, 2, 4 and 8 are silently rounded, wrapped or (for 0 and
negative values) turned into the maximum code, and the write reports
success. sx9324 already rejects such values; this does the same for the
other two. One patch per driver, as the Fixes tags differ.

Compile-tested only (W=1); I don't have SX9310 or SX9360 hardware.

Arnav Kapoor (2):
  iio: proximity: sx9310: reject unsupported hardware gain values
  iio: proximity: sx9360: reject unsupported hardware gain values

 drivers/iio/proximity/sx9310.c | 3 +++
 drivers/iio/proximity/sx9360.c | 3 +++
 2 files changed, 6 insertions(+)


base-commit: 340d44bdf9db0f095f99845b5ad8628781d79b6f
-- 
2.53.0

