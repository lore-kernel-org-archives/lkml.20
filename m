Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F0738654F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790193304; cv=none; b=AFcaAYPl2UvrbGkVVfkvbBXJCYAxV6tE2zatryuaeRWwHFORGrUhX/yWIsKOtzuiFlJD2QMVXWRgMg1Vwl/PUJuSk31TZ9A9NAaH8aPoowsrkRhX7y8SaZRr29bvu2xBO2j2agxGtGdrXRYAWkBZ35qZ2SW2fWAr0Mf3QrtKUI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790193304; c=relaxed/simple;
	bh=dNSQS3kZz/gv8losSbApqlfF/nIQ15KTWrm00GSlLRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKEJaK0vKlxhEbQRKnrpJ6KNi7wvmT1Ka705YGUtE0C80kskHr7EE6XR5YiVC28O1u8m0TNC2S0zLV8V2GPs+3Ilou+enEaGVPqh3w+TFxKlcsO8dhseaZvRoyzRngTkTz3/Peuexe4jcqRYaHO9a4545WyMVYHQYcB/21O0BnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVknQKLJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVknQKLJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so178304f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790193299; x=1790798099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLk6o6UAGSAyPrMGXPvZEKdQLnv1x/FQZrjKDEESrwE=;
        b=FVknQKLJNFF+Np7F8gEMeZuO2AEp4XlL17oX/lAAEKCqxQjM4RxtzKLQzZFb5Ac1IO
         PAxYxSZSqdeJ4swdOm1wMtJmIF24W2/yZ7ZfQf4sX/gpfKYRNSbtK3IY/HvJOHnzunDT
         sGBuEEjx2PlPYpDWQF/0ePseEBD5LA/QokcOMKcIGyGYeXMN+j0zOyQlbyHTtfLShTlX
         D9gEl+jFAlXLNlVoYDtZGWSVsCqXTOmENS11MXJUQR8UP6iHGLzNIXYQR1QEuclIye1/
         JYQUJbn3O4zgw4lK+VRbEQD53ipBdaj0P63ISXV9sejdE56wSjH2g8qhqP71Ot9UfMS0
         PHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790193299; x=1790798099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLk6o6UAGSAyPrMGXPvZEKdQLnv1x/FQZrjKDEESrwE=;
        b=GTRVlIHewlG1aIXZxdpQzvIHqtzqHF+0eX0FJco4Nav/VUNVPwyPDP0nsTXVfwsAHo
         VYn42XJ8h2waCoGTd/u4NRvIegbbQWvXUruTK0FdzOPAMDKs39qN5IZZelrgIT80vtz1
         sFYA5M0Suhnv+jmyGmLTYwOufhFqjY/H1BuaAtKAQWgsBYdQNrA4pUJOe/ccpb8k9Bhq
         z27aWcb8xW5WDAPYguAj5gC3CJJ7ax4GDHyUV8jtQgBqQzq7H4ZF8ORgURMNM5ZSTyMq
         d+hSrPaxpbv0wiSpC4bB38hmPM4QoLLTyB3r5DP9o6GcEdCFtAez6NaP1kR4VFL61feJ
         B5aA==
X-Forwarded-Encrypted: i=1; AKwUvBy/KB1qTGxRw4I7Dj+iptnqlluvTTCLbx5QeMYqqki/RktJR5BQ0kiUlhV4U8A/VU2Ovm5d2UlplPBsOT0=@vger.kernel.org
X-Gm-Message-State: AFuF++m7b/PRs2Jj0dWLj+B715sP7GcpmiET3SOpW3dFz/9daCHPpDsI
	E4Jq4IcLhBKUFzEmvonhQrS9emgQzhKGOFdIaEdJthg1sSJryEToW6hJ
X-Gm-Gg: AYBFou3w9greaEqIE5rIohLFuPgs2epgc47x5xnl+WU5xRavUzKhzHYtM/dfO02rX0i
	ZzKcXSFqsMT8GVLYoJvO8qQFhsJW9PGDn8mff1NvBZ/AXg3ub5m182eUvzq0+cGF8+sCCYwPFsW
	K7bqweY/HIwnPUvwgqolrBN/r/tqahMhhk7c3R46CRA/w5pq4gHiMe3RMkpZP536DhFjuu8OQrC
	mkyyiPtE+Q4lZBCWt0zFDNqLVBrpWAb7w3qVuuXGOv7dPZrNil+G+szqTkTezTM5rfuZczwtX80
	uXR37DXGAsit60uNaoxwzVR1h9M3tcZDxgh94WR4QKzJe9gWExvo72OafneQIY9rqG4+QlZCag1
	mvd9CywKTaFJ1kz6pr3UUGxE8xWPFbLG+rKpIUrzyf90kFbhZsA7Seqjb2GvF7vDS58nCSgL6/+
	NmF8XN5ZROLpiMbKSOOPDXr2GGgv1N7EB2ilnfWb2kKC4I2VAgzn7Uf6PpC5GyY3fYuwTnNwpnc
	6WDFPDkwAf1VXeZHK+3btjNcqPXbQ9qSh+I2erIcGA6jItvP/uHe95vroL1AI867BwblZ2pFg==
X-Received: by 2002:a05:6000:2083:b0:487:a9f:4fa2 with SMTP id ffacd0b85a97d-488716ef593mr320372f8f.1.1790193298626;
        Wed, 23 Sep 2026 12:54:58 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500007AAF7E1F4D006B.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:7a:af7e:1f4d:6b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm8592627f8f.30.2026.09.23.12.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:54:58 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] accel/rocket: DVFS for the RK3588 NPU
Date: Wed, 23 Sep 2026 21:54:23 +0200
Message-ID: <20260923195423.10244-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9cc5365470490b4b66364e60fb614ccda7e86c6f.camel@ndufresne.ca>
References: <20260922080114.44662-1-royalnet026@gmail.com> <9cc5365470490b4b66364e60fb614ccda7e86c6f.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 03:29:49PM -0400, Nicolas Dufresne wrote:
> In future series or update, can you use common formatting in the future, I find
> your changelog hard to read. Do something like:
>
>   Since v1:
>    - Changed patch X with action Z
>    - Fix blabla
>    - ...
>
> Its actually good to be more concise in your communication, "wall of text" are
> difficult to cope with for maintainers.

Thanks, noted. The v3 cover will carry a "Since v2:" list, one line
per change, and will be shorter overall.

Igor
