Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747C6306776
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873440; cv=none; b=SscvcOB1CXs9r9T0BAJdLcIysIjG8xjf20b0GFaNJcem7JdtP0YcJdlq5TKO2GmuL6SJMoG7zJcVD67Crcq1YmczTAyfh+rMCGP61LxbhEe2+2uiTTsYJkUqfX+S8gu1ecOooSDzvC7RQjeicIZQ5o+NTgnlI98wfE0R54Y2e9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873440; c=relaxed/simple;
	bh=1/TE8jVp1mgIX3w95Qd56lz15ABuBS61Pi2gCb8R3Ds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fSkzpgfzDtygGO/gln9YJSMvL6xOkZu6c0pLsMjEg6jfPz8EW53Gge1OXNQvOJBJqdDEJl9ibsvd3NqKGVkJNMxZku/EenS5YukTv7qDUe95Z6ZPI4nxQ25WRTTDr4xizcSdX7mKwSDIvo+w7SLcNPNIP8suN0I+4PpiAkiN/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+2o1y3/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+2o1y3/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso23448355e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873438; x=1792478238; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/TE8jVp1mgIX3w95Qd56lz15ABuBS61Pi2gCb8R3Ds=;
        b=g+2o1y3/Qb+VFogNhJTLfABPi3jNMKJ8xDV3ARSQIFY1DuLSfvLolbZ1FGtslUHRYj
         KUrE7CDXlybFIxxhdzDdOJotwrstec6NDm0xEe5LYkgZYByhGBX8uGJ8JMMgDINDFRbB
         4lkGuMmS/8jnVzEw4OE88EZFWY8VWxK4qmeRlsOkimvxVfyMI0lkAVLgkqGMcm/KsLZ5
         2wFB9jowc5OUk/mzxXfpuZT592XIasSP2ZUXFilXM7UAGDc3hfmywsF70JqggBBCLHeM
         qy6g/BDhtAoPDhNI+Kv9NBiDtVVvlvOPcT357LCftrYJwiBP5qYHY+lxWfbOpITnXhU4
         Yn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873438; x=1792478238;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/TE8jVp1mgIX3w95Qd56lz15ABuBS61Pi2gCb8R3Ds=;
        b=K47E5qrhmoUmJ9mtUokXOo4GkIkU3SqeBAAacONqL2NO+ESwCtdtffU1Wnh0Hb43gP
         H7NiAhae2QUdWB5rYp+n+PrQsAcPUSCeBxPg3wkzkNq7uyKzeL/IuP/AUOEE0GZrM5FQ
         KFIQft/NSzhvHM61821QqM8uFTKOtJdL5lhDdY5E5ZnPVoOdi0c80TcfW5sNRX5OV4yC
         Ic2e9vEWFAxAIVJcRu8V6QGcFNf1eTXZGrMyTDoQSdFWaP8I1doOTthdsQ65aIpJkAvT
         GT2OHtb1QQi0fsV+TGri4zynRVecfNdIa3ooqWUDson4H2wHM6wygrmzBzdVO5F/SXlm
         LgbA==
X-Forwarded-Encrypted: i=1; AKwUvBxoK38nCCsG8r0BSX7WzIQqGPFzXdDcvIK8lG1K9eLBUgVqdRVpYJ9AVlEQWItcljpDzpkns6BRLSCRC8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlawICPOXzEJBXNosvoS6CES/+49y9vNkAsfX8gS9l7ZhUdg6l
	3UVghPCdOk8vqBX6O5tI2f2alHtmxC4SNhB2UDntP6MMDCzfgE2gUL7M
X-Gm-Gg: AYBFou2CAzsO3q+kIn/BmSLDBL+zgiNPyXehZxSrmjlWB49aC+3uBz9TqAeOL0E85zG
	cHQ1H6a7fR/i3ZHbfWBc7Fr6GkzpZ5qfTErEj/b2Ixcc9pO71pmox3sqSIKL7PU36krVQgyMWfb
	kISWa307EH9Q0rvqkex2Jj/FFxbRFggtGQLrBJiPayvDKa7mQHt37KS7IRfhGm2b8oWYbpTMv07
	iQgkXcXVTegDIGgjAnF7FHPFqzKPk0ypBmjWwE1lKNeswCsSnyprnYycVoaZFsF2deScV+3iW6t
	wN+mRVPHnPszTeJyMsChQt0vXRJNUMyLPISEswWEdop8nEt7rlIslvFZ28rQv4FaQ2aR40IIE3C
	OY46tYrUjy/0xS+MAiBUOijvqv+GumdvKDdmsORqTpEw3DX6+yaiWBB2EKXHBCZ1IQu8S+6LFzx
	U5HwZhyhsuZwzUnb1E7pnxTUoZe8erzSLCx+fhSJvzesRaflF5MrGg8H0KslTvNuZ/gEIlZCxfQ
	//BXifndVNuMdjZ2UCgenrgyWdUBM1GcB6H4rVg+S7Fbo/Ccw2fnZxNxQ==
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr229014865e9.19.1791873437754;
        Mon, 12 Oct 2026 23:37:17 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm434795675e9.11.2026.10.12.23.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:37:17 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
In-Reply-To: <971b67a9-7e3a-4fde-a8a1-e5a78f8d6436@kernel.org>
References: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
 <971b67a9-7e3a-4fde-a8a1-e5a78f8d6436@kernel.org>
Date: Tue, 13 Oct 2026 09:37:14 +0300
Message-ID: <179187343453.3124451.12229499654368455627@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On 13/10/2026 08:18, Krzysztof Kozlowski wrote:
> Way too many versions of huge patchsets. I already counted 4 today.

Sorry about that, my mistake. I will leave this series alone for at
least 48 hours now and collect all comments before the next version.

Thanks,
Fil

