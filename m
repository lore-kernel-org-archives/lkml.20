Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991ED3BD65D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944870; cv=none; b=g8gkg8POoHx0G7e9j/n7G2QbZ5I4JaTzlFrABnDDl36eCxxuqwKn62PlJ0VpDzhmOiY7DZ7ndD6RjkhLElGzEkwmcq59iVir2AEFYhEg6V/UMe0DOBdc96HlF5RXgmF6fCwXlTVT8aVllOpDuvZZosZpShPeGm2vzcQw13bih6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944870; c=relaxed/simple;
	bh=WquY7HvTUY1YNIuKfLmkwIUcPE6j7wZaFxlIYZ0OU8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Io/HxM0CshiwEu/UxSL++Tz44FUU+8DIPvwq/qhrEMcqheGb13x/Fn7FOnCCZ34cH/hHZHiI0cnSl3q2uy2KOwaLRJNn3k4HlyV3nFxiXbW/WGntADCBmt7YgDti/bOnjPKw10aFqEifcC1AUydPTrDwy9vvZcB+rpENMaQZfUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfdJYP0n; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfdJYP0n"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6714595153cso1048892d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790944867; x=1791549667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WquY7HvTUY1YNIuKfLmkwIUcPE6j7wZaFxlIYZ0OU8M=;
        b=WfdJYP0nApmRzmSmN8GPWxaEFKUe9P9FQkMQv/pr9N0DYrqoOIAgreOR/Gv/NXPtXt
         2/O+hLKEbjbkBglaeGhsyCgOsxqF/Cffy5MbAjXbMiEGtl033Oey/SC9tgX0EPTa6dxS
         me7BMeD5/ABKvSjrSsCCxEQpUvo2fFY0DlYfnYZHnsnfPBUAKPoVYtAjYC3o3gQk/O3h
         ryUndDoemkbuxCSI0a3IBfWCWEPQD+jov01QuvqnzTWcxajb++txJAPeHDyhYEdsdg7O
         L4NdvtL1P0MzBOjhSGQbahzMClrwEF9RenFYqhvfLT/2vho11ttkdRkfQEgTATvTsjQO
         Omww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944867; x=1791549667;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WquY7HvTUY1YNIuKfLmkwIUcPE6j7wZaFxlIYZ0OU8M=;
        b=sYgM13iL/kfK4LrBQ+DAbhnRtzVgLMTMCemHSDn0PhDeHWCxNBKFZVNYEQca9wTcNl
         nH530VCts0SHcWIriW8QFurJZEA7qwadqZWUu4wgBQ3p3IiTEXvawDRNdN69lrX9bbAK
         aJD5cWxBfzuBGaklznzu2KDDPupU1eWkzK47dMz/iS+kHx4/d1i6YoBSk79QD5mcTLra
         JdA5ID62+vIzBSe2l97paZju5+JhqaEZsv6b0YuS+vdhR99hddXvoVpjsM2Miidr5Hio
         +UiWJz0Emx+VHR0X1PDq1po9HpqbxTR1K9rYi4ZPApHv88fKhipdeiSYoUXy7iA3UaRT
         lkPg==
X-Forwarded-Encrypted: i=1; AKwUvBzZY5Hy1neh1lUu3UN7HVy+AW+UBXN1Vyth0HnDvBFM0XE69wLtzYK2EppWeNL8drk6zfHSat13PjSZzOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU0cLgiKFMp7IbBefNDZSKdjPWqyaJPOfFGelrEhjRHAIAUSUb
	QtykiaWpojTKqsEaGbzBolYF/A+qin8QpdnpxrbsRP+SwRrU6hA1kaA5
X-Gm-Gg: AYBFou3dSeWD0X2eYBBnR2+BYKXuqoxAzXnDVxbNon2q1mDULRfhJas5s8Js0PReOan
	3ce3TuaK779dy1ysQAsmCRYwLmRORQqaUJv2qEJfDNs5+XTDAV/vzufLsmwxNPazMLsIt1sqNv/
	C6nCFZHCa/C55RboSyth+rz46WGwIWg6AhOItt5O6PjGcbIoI+AA/NL+Tlv9y/VoHNSI+YxEGep
	Igxs7JsKtq+BxRhaJvKTrYEwGtqdYYcgZ8n9vmMJWt0TnIU6CtvbCruWi7vMWZPBP9XKGvZsQIl
	/Na466Zxyyd/cz0hmFVokFvCSVT9mshBYsiEfmmNg4O+HzWFWVEDa+X69ChFMZsroHvxd1LZkl7
	KyDdTp3sIflkkEv5DJnMx0TiFZlXkkxX0bfsakyBkf/QRcLBULZVhb9fB5/EZpkVOa1k1BY8l2O
	4FoSPvQHjX808eo8C0uYijBDIUCcBUusRTUFe51SLkTjZ5lHvXWnHo/LTDh5QRS2w73zlm+I6sA
	NL3KMPL0pYHprf6RjIm0rPrhcT5tqBsOyFUTer2in815vcdHlc=
X-Received: by 2002:a05:690e:4344:b0:674:20c8:5af5 with SMTP id 956f58d0204a3-6769119554dmr1834462d50.27.1790944867295;
        Fri, 02 Oct 2026 05:41:07 -0700 (PDT)
Received: from llmbox ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677ac3ba68bsm875023d50.1.2026.10.02.05.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:41:06 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Fri,  2 Oct 2026 08:41:05 -0400
Message-ID: <20261002124105.55173-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <60efdb3c-e669-403d-b2d5-fee993e16217@kernel.org>
References: <20260928215021.819064-1-jordan.mymail@gmail.com> <20260928215021.819064-2-jordan.mymail@gmail.com> <20260929123422.GA349401@killaraus.ideasonboard.com> <60efdb3c-e669-403d-b2d5-fee993e16217@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Hans,

Thanks for pointing me to `v4l2_ctrl_auto_cluster()`. I’m trying to
understand how to apply that model correctly here.

From UVC 1.5 §4.1.2, Table 4-3, I understand that GET_INFO distinguishes
“Disabled due to automatic mode” (D2, a state bit) from “Autoupdate
Control” (D3, a capability bit). That helps me understand why AUTO_UPDATE
alone should not determine the flags for controls with an auto/manual
master.

The Tiny 2 and Tail 2 pan/tilt case is what I’m unsure about. These are
the only cameras I have available to test. On both, writing the V4L2
pan/tilt controls sends a target position to the camera. With the
AUTO_UPDATE fixups applied, subsequent V4L2 reads retrieve values from
the camera that follow its movement towards that target, rather than
immediately returning the commanded target. I observed this with tracking
disabled as well. The pan/tilt mappings in uvcvideo have no `master_id`.

This is what I observed on these devices; I’m not assuming the
specification requires live position feedback. In particular,
§4.2.2.1.14 describes pan/tilt “settings,” and both cameras advertise
UVC 1.00.

Would the appropriate approach be to follow the mode-dependent flag
handling you described for controls with an auto/manual master, and use
`VOLATILE | EXECUTE_ON_WRITE` for writable PTZ controls exhibiting this
behavior? Or am I misunderstanding how that read/write behavior should
be represented in V4L2?

The v5 I sent fixes the event-notification issue but retains the blanket
flag mapping, so your feedback still applies.

Thanks for helping me understand this.

Michael
