Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883B4519B9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044336; cv=none; b=pyaMaDYQmXvhf979RSraLTaFVazP2Ij5ewWi9dD90UVVkuhQoBipjnE6dy5uvbaeiDlzgJqHc7rURj0zvB86Kp+8M4X3MIOKLzLIk4AWAURI0bP1kv/1zaFpilTE9tHv33q8Mx3zCOm4se33FRRCyD5+hErDC+RwgmVvCpaIR+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044336; c=relaxed/simple;
	bh=ZXWJjg4/vO8kimwyxG1j1azonR+0Mw1QdQt+X2SFpjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FE9FuP0ormpyjBwT0lLrU7IkJI+KdYbH098pNirr6PEy/e5uYEIL8QF5bJA/AiUJAMWsfNfHSe0CKxSR3sNBpkxEIfzEGvjKDQEpCzgw5cRA6n1UGBqpelb5K8nGkD/bcqbJ03yDwgyE5yWzugub2CRO8SYSNCJ/SDtKV+dVCIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHVP+bN+; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHVP+bN+"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48afdb491b1so219799f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791044333; x=1791649133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofOK5rX/Ol1Dp2wHU6Wg1KvPujaWtQi2ID69h0RWSjQ=;
        b=gHVP+bN+lRuIDS+JAEd53x0Z1bkiDGK7IT9PwPoeMcUC9b5eoabZhUNAcBI5IfbolW
         B5lXPDxlh3mqTKkyrg+OPc2dFAEE81PRJP9m2WuwJOZmXhFE2ObrowBKynPOrPzDjr/S
         69jf4UB7W3ZSB/uLOmwvfl36egxu623tTXqTBm9Xeal4GOwZ2p8xFi8DWEygja+5LTw8
         fNY2rN8S52liEOl0Q2S2zn5i9ZStP85SOzEWIbbs3xLzE2NtorFrtxfiQ/E8u40dC3A8
         yu77AwTNV0ro3Xj/YajBX/Wk+Dgi++RME1ZaBdImzfbR+9n+z8YxdKpFhCxlV1UVSYSk
         cjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044333; x=1791649133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ofOK5rX/Ol1Dp2wHU6Wg1KvPujaWtQi2ID69h0RWSjQ=;
        b=UB5NtOUCZFQmVMFxOOM93xzYpYKSRKKECYUK4Q/pxb7Lrs7vAZnwV+7qJ4eAh2NTf9
         bNJwD6ls4CuA/U0cB3oKNDDawV8ysmVICLUjB0MXceYHFL0NUtwvujK/yCeD/NZnT26u
         sRdTRoC4BJqO5uYWAcrcjO3MyCqgdEwVXK5Ltfd1I+G9ypyuHR4Ir5HIe2BvyjvtrPfj
         nrrZZXx4x+eBGOfafz3Srpg2xBPHlLLcVuMAP614fsMbyp2TBRS6obx+LQAPPXZY5l/V
         llKJ1yGyKSWWdTyTkBNXPHsINb0DxbfXrumDU33mAgYmNx5w66pYbb0HE5VPvxGw7S07
         OHEw==
X-Forwarded-Encrypted: i=1; AKwUvBz4dsre+rAgxUCJJQ9imp98qlfaEcfhyGEAX1sh+ZDDqONujMRNew01Y7SMFqHSOEYtgikWmVnFDVtT6V4=@vger.kernel.org
X-Gm-Message-State: AFuF++k45LuYV73yG4/4dvoAyvxt1VkCTyPoXOEBq2XvKBZWVByyL6vx
	/S9//vzFUD9lX8iq6MraKWzh5XYPYdylM9V/t5aPpNBhcoUy8jfXWt0N
X-Gm-Gg: AYBFou1SYD75OZziCXW2AiNon7WznumKBx2HNulbIBKr4CXQKA4nvGACP9S2rDNHR8I
	TliI4+dRVL6TnO12JkQScz81gLtsM0ohXCOvX/WsBAp/pSkXteVDvwr4q8KdD0xtI7VK+q35Xcs
	GoGl5/XCSl53YLV4AC8NhXUMNKA9YB5Irvj3D3+QQ0N2wFlm4bdCipLg9mF4XfQwmUOkWniZJyz
	qEsw9Y+s6bqJSQZioMLpIlLLdFtfCBRFD+17JFkV9ZcflarROi0XRkVYDz/61oGbOF67PwZUo0b
	QnsxNakVHGUULaMPrbzr82ZQIMKwvJCodKPi98zS8KcUfBMsZGZzq6wIumCBrs3thkukAQznTmT
	lm/jBGfz/SW5h9Q404He8kjFZUuDB37QblHGcUPPKSbHuWNf81RjKkfJXcH7JoyXiGrL1ItWtVh
	23eHMkw2WjDBoT5Q9h+WsBKaKAO6tTZjbyS2JpkUXm1wxeEjfqXHpZWJsq8ilh8r4wjBmVFpC/Z
	ieTdb/YRcj+HAA=
X-Received: by 2002:a05:600c:530d:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a0275a22b1mr95334765e9.24.1791044333017;
        Sat, 03 Oct 2026 09:18:53 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.192.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef5950sm117972475e9.2.2026.10.03.09.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:18:52 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	israel.a.cepeda.lopez@intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	serhatkumral1@gmail.com
Subject: Re: [PATCH] usb: misc: usbio: Handle negative error code from usb_control_msg()
Date: Sat,  3 Oct 2026 19:18:24 +0300
Message-ID: <20261003161824.22338-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026100327-doornail-jaws-c582@gregkh>
References: <2026100327-doornail-jaws-c582@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 03, 2026 at 17:13:45 +0200, Greg KH wrote: 
> Ick, really?  There's no compiler check for this type of thing?

> This whole function needs to be rewritten to use the "modern" control
> message functions.  I gave it a go once, but it quickly got messy as
> this is an abused function and it really should be massivly cleaned up.

> Do you have the hardware for this to test changes?

Unfortunately I don't have the hardware. I relied on static analysis
and tried to keep things quite simple

thanks,
Serhat
