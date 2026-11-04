Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823180;
	b=MhKH4RH5/sjQslv713tpdj9NTUkTkxrBnmwYKTntDBgcby6gFTs/btEcB8v9GKYi9trb
	 TKdg7+1XoqZe9yscBOjsAauhJ96c+EsmZHCOPNmf7N6e5T6JeLsLX15LKjDRC1cnUVIK4
	 P/9eNtPd5Mic4mHDzjBBiLajO5rz22xhc+ecBm2dRNz9w6StgGIViur/fxOahKW4a7DZ7
	 t399il/VJekq9Gy1Lb7n0jNyR4BqzMK1a3uS5b5ZIEUUzrRZ9bbaqYJzjL6bXHAoN+sg+
	 mBkh4wjoHspI/1iM9osOZmltG0O2FVLy3hOOkSIDQtm2rjAJ6U0Habf5KV4xsSqe6PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823180;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZxXu9zhPw8w9HM4Z494ZQ0afNqUzJO/nyo7WE4RsLKQ=;
	b=RQAkgC74If6T868KHIBsxxo01T+1X7saJxVNWuMevM+Ltnr2PV2YY7TDyNceLrDpT5i3
	 TD1JzWmRD9Ix1YDSjTkAAl+k7WRGOhRfaHbdc+oUfZ4iY7oQmflVtiiqxj5hVj9ysvbbJ
	 KPStAXKIHKJ4A64HOZHDJm4c4R+yXe/EnchTj6IlyXtuNacDvsMRg5CfP8kOBS3wsYBBx
	 HyOh15h7O5ycLqHAKvcwosaEOXKVHMhh+g5BKx4FbnI8mzEH2dfY+ZGtbeF6DZ0wwFFxW
	 0hCaIaNQ1jMbOLRGSM1coKAE8YULwbN+d7mcCEO3KIYxvh8PDVFPMWMlUiIehRocz/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD762608079B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD762608079B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso807319a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823179; x=1794427979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZxXu9zhPw8w9HM4Z494ZQ0afNqUzJO/nyo7WE4RsLKQ=;
        b=F6ZzmaiSvXgzfacWIFSVGJ0TD1tnQO45ho4u/U7r/re3ysVAhvucJ8sTnIP99/Bcpx
         x88zVFEMHi0z0VJrfD8Q8sBknw+P6QdBgaW7Cdx4OZ5r51eduGlCZw/1wnOtWPjrqe9f
         D67M7UwV6LxH+qGGfVTq23OpKLrxd62JmWjcDks/lmiB57LUOWmz9sPR2aEKDHYFrLxj
         Jhh+q8tY9e6EIgXZxiFKK/s/O7yg8IxKuXlzvVXySkwXf1vV+smDgxbfqpqK6yYjtOvv
         Ii+Y2kitku1XYE88r7d+Rbai7XOiv7Eg18A3LzInVPaXHrJLQMBWsY14PuqqKtdgflj3
         1Eew==
X-Forwarded-Encrypted: i=1; AKwUvBxPeOKjjooWurUBZGw2Ll5S55g8nVzZ7ziMzp5khB1ADoSSADQgm+hmAPnPSggeVFwXTUy3932qtpVeJ2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sxqZs6WaCoi9OJKdnwCLiEkWVlqSSzR7HNP1S80tnyhiZrneY
	9CoVT3bnWxR229op2vT7jNbuYejcZ4lth4c/z9fgzGNQgAEwLhWzYIbMR3eXXuJN
X-Gm-Gg: AYBFou3/EqhXs6gpYJCofdGAh49Rbq95SkmV0JLZPpYPOiNBzkIFRBnCPGlUfwscUIp
	BstSHQn0CCRkN0k7P/n2SADn2szHvkwneUzTFRXPbULH2qQdQxxnl0GziaAqMiKvjkRiJ0mNxuC
	+15GZDZWGkGfJ3n7ooqh7Ohr25Ino6UvDx33PqQk0S3EHjySgLD/TZBFLa4lTld/nvGnB8+eU7i
	U+Bc4fdEsjCCp57jFIFV0jstg95tJ0wJ9PP1/gh1CYXGJdZ1ktWIewYYPGE25SXyeFPZjXFBkuu
	dkUtloU74795n5poOSoX83Q6b/mjO5SzMAIKi/bBY+Sd7l62a+j1EmpWg7T7m2FFCzVXyhD6tMx
	9mIf+XVvni1/4GSdTkW7BJ3MoQ+AarjZvJDepZdvMEZ+Pv0UhFdDC7ohV0THLrONqYo85KoOHSu
	MnxD6NvbddTz1sKAG/rAHSGqYKdU1tV85on5YcIdqxZS9+7Qf4slDL7bneil4Zzy7mQFC5+duL6
	RPJf6bYhkgr6mHqusfrH/Xp6F87cxElk2WfdqGrhV2A3jlsy3JBO3ML4/E0YbuTHFB+LkCrdcKM
	/LuTCsMR5LTgZaxf1q77QMrvkApIuH5kkxo6DSFRm208576zqO0Q+D/+U1gaCEUIb+WbPahZmCl
	Io2oTDjiizJudkVqUnUebyxOUDx9WxvdzuwIDlxo=
X-Received: by 2002:a17:90b:3844:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3ae89814e4fmr14245235a91.30.1793823178956;
        Wed, 04 Nov 2026 12:12:58 -0800 (PST)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com. [74.125.82.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cf4b6sm404368a91.14.2026.11.04.12.12.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:12:58 -0800 (PST)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1252684c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:12:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzPY9NX/5XbIxqGNHHN+RR5K4PQWVEhJ2Jk+QDSmsgjQjK6TC1qpYeume43IpeqELYLDl6k6xBgUBnKQlM=@vger.kernel.org
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id
 a92af1059eb24-1b0f0f5e3b5mr18258532c88.34.1793823176925; Wed, 04 Nov 2026
 12:12:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
In-Reply-To: <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:12:44 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4eJ0Pa1iowGEO9qe4E7zyFoGp8TdjB=O0ws9FKUUGiRw@mail.gmail.com>
X-Gm-Features: AclHuK_90z-X_G7lwJns7lB_5N2ZLz7CerbTGbvWSwHLWG_G7heWWc43q7AWu_U
Message-ID: <CAPY4CJ4eJ0Pa1iowGEO9qe4E7zyFoGp8TdjB=O0ws9FKUUGiRw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why? This block is one used repeatedly inside this SoC and SF21,
> I think a generic binding with clock & reset description in dt makes it
> reusable without further changes and also results in a shorter driver
> without a table.

I moved them because writing-bindings.rst asks not to put in properties
what the compatible implies ("DON'T add properties to avoid a specific
compatible"), and each block's gate and reset bits looked like that to
me. SF21 support would then add its compatibles and tables.

Either works for the driver, and I'd like the DT maintainers' view before
v2: a compatible per block with the bits in the driver, or one compatible
with the bits described in DT?
