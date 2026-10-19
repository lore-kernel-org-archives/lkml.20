Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494E380FF4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389705; cv=none; b=uElfRbl/9JFHui6Iweeenc8aB+CYevnaQJeo9CxwFvRzCcl2XVUfLIYLyTMABkmPAdAf6x1QQqukncSeN2s0GILVSciLZo19WTNhEnco5K07yKi0hgMst/XSjvatOoJ5bF/oS2uwkn/KMsOSkN/bclL0I/6y5KYXwSg73C3IItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389705; c=relaxed/simple;
	bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IT+pnyfdMO2J/BqOakvqd8JU9qiXH1h0uDrKqDdGA9MoH6lN8n8O0WbKRElPaF3R+bu4CgJkSrfLG+S0NrEjn4uPpV8lGu+E4KvKPUEn7Vd+uy03BrLuf10QJW2/UBqouy9+xzp+UKDE/4LiedaGPit085bvglYxsNkxdL90Esk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVarydKM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVarydKM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso12159975e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792389703; x=1792994503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
        b=CVarydKM2wPlPmY7W169tHSfWFl/CO+e0ZQNdVNxHgnsF1cLhZdnd5KrzqSKSRIj3F
         BhjQa0+AgMTIBtzUv1gcIPtEkmtlAQelga0SCTVjqI4z/FVPMrlVHlQ5+sNxIMx0X6qS
         GON9q9J5eu71Mnt932uqrMTyDoSP5AHM8AKYVrCTe753yFILDipd+LYKyD8GboP9u5FP
         oKF5Bj/5+bjmxkVDc2RJOV+f62G1pg33r8rl+rYpr2JHAsH+W8W8XhrMn6QrDtsKLEwd
         o4cciSt0juX4Dr0VlVj48jQaMX2ozAwg4lvLoWuT0T24QFqIj8tt2uKBAj1Yy/4EXm6t
         QeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389703; x=1792994503;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
        b=em04RjYViG9i5bFpU8037SIBdP9n0W1LmvHgqt4NSiwK8CuEZmJ8A81GCqDPbVYWHV
         A0S9MrM8vvJt0T3pcemgnZGP7V4tPoe9A/uFyPPmWUwjDwNmZKJbHo5ZU+sVq5ts8oo/
         B6rZKuF88WiCDK9grkjRKnA70YOvPw2s2zpzZOfAXLP2UW8GW1I55hMCmGfEV3H35Yff
         HJOflnnbpk+KYU0XQ3WpITsx9OWZjrUt6Vv57l/TI6TbcZ9ftlGTMqiZ+TU7l2/OmTml
         xjmlRYf7ZOmnkAS0SxZo+D+ftimhXra1LA5UGUTcH80ESY2XSzuuKo+wMOsNNjxu+axx
         XddA==
X-Forwarded-Encrypted: i=1; AKwUvBzHFzRsALLAiOVvRC2QouiR0q0kb7ufd6YoAZxUBZi12Z0you0z6pOia2HiEBCmWIpeTzDUghVWXghmQBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDadUrcT1AUjfpGaQtuRWTMOO9Wzza2f2CwiWGYX6pxU4X37sf
	NC0p4QleAPSJB/g+hDKXstNAFUV7CFgAdTTu3GtKr+bY3Sib1mopoPbL
X-Gm-Gg: AYBFou0lFRcxXNvjcomD6vwpPjxSlF9LKKc+OLo1mGuWfuM5V5IiBN5Tu511P++CKJL
	5aFWPnQX6Y1WpCodfKdnHpplJh5bHmYVFGOHpm8aW/59k1fmpv9pXxoB06kA4cvbRha74M3woMM
	gMcFdcZLXBAD1tGPn+r3d7Nip4xaGX0LlypYPiNRdHS45ezkRUHR2JWb7R8MM89/twp9BwG+Sl5
	+BG1+JURALMta5XWHWwijd5wQsH4qJm2Xgo1dYJuOafOR9bK6Cxvo9BTxWdt4TAgHXF8CRZlRCx
	Vjqp2oaLi6Mrla80Eg7SjHPOlnd+Zzdmzhd0NBYx+9tVDgnQRWwclBYyQGbMjSOeiL2NW/cbLSl
	xoLtaL/ttKxNunChd7bCHrf3tEV+NdvjrrjDC0OWo4l+fsYb7Pnt5IuSgHwsCA2n9qaBEgYpGoG
	/7lNhFwQePVuVzSWete8Kgf+PgTredr6IhatRG/eZ5utIPWB1sYgWZsiMxXc9585+DIyNSApVtw
	55UaFUvLljdWmXOVxtkolLgWD6VfCt/Uk0uwtMze1Thh/A3nkbo+4qE1WqQ9ftM13FIEerD
X-Received: by 2002:a05:600c:8709:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a1d75f8f28mr128077975e9.18.1792389702573;
        Sun, 18 Oct 2026 23:01:42 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm17817528f8f.3.2026.10.18.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:01:42 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Date: Mon, 19 Oct 2026 07:01:40 +0100
Message-ID: <179238891227.1168109.10270505331710088980@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019054322.3675-1-lsa.uz@pm.me>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com> <20261019054322.3675-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792389254; l=701; i=geocausa@gmail.com; s=20261015; h=from:subject:message-id; bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=; b=DS7K/pbNV69ikcT4O9oFfkWuvpKoUT5+ggT/mW2lfw4MIoEmtfMQ6LjF/XliH8N0jK5n87w1q uwvJ3HiXCG0AghdVQjgFgM7sMmoQ+WnIBL20m2Anfrzo00reccsco6s
X-Developer-Key: i=geocausa@gmail.com; a=ed25519; pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 05:43:30AM +0000, Sergey Lebedev wrote:
> Retested v2 on the Intel model, on media next with the power-on v4.
> Loaded before the IPU driver, the sensor's probe defers ("parsing
> endpoint failed" in devices_deferred) and binds once ipu-bridge has
> built the endpoint. It then streams 4224x3136 at 29.95 fps, and
> v4l2-compliance passes 46 of 46 on the subdev.
> So the Tested-by stands for v2.

Thanks Sergey, much appreciated -- especially for turning this around so
quickly.

That confirms the deferred-probe path behaves as intended on the Intel
model. Thanks as well for reconfirming the Tested-by on v2 and on the
colorspace fix.

Best regards,
George
