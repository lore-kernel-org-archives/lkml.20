Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3548135CB95
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 06:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788588662; cv=none; b=MqvSurs9sHHcC9OwSr1+rLzsEjew/5xdMwBbxdp2jrJtQpVqUwnPfg+1ntreTWdiGcVxRi88dNNQNj/Rp5pWzbKy5uOLz7VdfHiG3+o+cGg03QoeMlsEp6lCteJn6J1RET+62SuflJXs8zgsdFeGUQmeQF09ZCvGhV2u6e6Jto8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788588662; c=relaxed/simple;
	bh=ry4vGBSSpg5YRi73Rr4LpPYlWBEEFTeBm5uwyKo224Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XAozNBs4RQoCTq9p65OhDrn1D9HUvpeovwVVPt1osxMo1F4r7K71y66ERfJrDUxbSU6RC1lKDbb89M9pnUu73Yfw8LHZIJ+IXepDGwtwOIrw2JD8dMgw424p2vjOQrIDoDq3NYi3rSnCrLgbpRT8tPMjn2WKl024bqIvm77PN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSoQ5SMW; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSoQ5SMW"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc439aa0078so1520592a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 23:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788588660; x=1789193460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QcCFJXuQosl03AWfODASRunsfDvx3Vteq/vYGjFiQtc=;
        b=BSoQ5SMWA7Ry71E2InyaGh9zXB/24pdFrNA/H8WqJ5jL85E9HuAW0F+ak0V1kBjB9v
         ZGf+1nv44pxZ5l3/lLH748B1pSEFKwtW8qh9ynuKzw+IabhHPPBxFdMX2MMraMQGp1+s
         pHjhGZDte3rMHKn5ABehg1X4l0i3Ayf9+I/wwkcW9/Wq6knvath9q3C3OTzDm1wt7YM7
         lzDJkg5vYUjTPP00fgsgvm1vfAaMS5W1pIsJlmNeTKRjqqDl7lk7nEDQRdlbdv1W1Y0A
         dw4cAazL4Gsqfz1SAkaGkEP/XGSNJhyTdRB2ygrz7PQa9658JuU0rOHUlBNldm+oqOs8
         Zqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788588660; x=1789193460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcCFJXuQosl03AWfODASRunsfDvx3Vteq/vYGjFiQtc=;
        b=rJKYs+FyypCl8tvPkcISyUF+mxzxYsIVknWmltvkdmEXtwtW0455qivszJ1ek9fPRr
         yuriHkAZjr09X1kC/dTdS7XbVDbOSoAJ5OHZb2NuKIIxeAeP9Vvtc3ZzE7rwkrelVmQB
         N451WXhjnWh8adCEiptCBCjkUr93v8lN9U820oJduq5spIOdIQ0EJl4krSwzJAjRe0Ei
         Fbb1+H3zk154AO00XDBmZL0Zk6ri0kWwSVFBYRdgzf0ZONH+/yl7BaAB1mQfbzre3sDH
         IFcsv0+8W0zrB02ZiZfDdMsm4U+x2tZRLXb38bFd4GeMei0Ofr8fIAifhsEg1buN8SoB
         ++iA==
X-Forwarded-Encrypted: i=1; AKwUvBylE1Enfagqe2RNpOjY+Eg2NSAXMioHfAJGO1VJ0g57IleHO/Qo5BxWUhiQrOitHTVqW5Yzt9KOjPPZuUY=@vger.kernel.org
X-Gm-Message-State: AFuF++nTt2Zz8n7FeYFWCEiKxw5vpNxPMeP7WnHt+J8Ct6ZFPVNqo0Xn
	6Y1AVoWSLZGlZTZgTD8EFPB+TqZyQxxC/F8bgkhPRqfEJ/VWSwu09erw
X-Gm-Gg: AYBFou3j0ynQm9ZGyIL+NdU5y1rO3NmRUsv+pEySOQjZVgudcUUXiF/5VzeDyrGbnDn
	J7gvUCh4Tg3019jIzK/EANf7e6iym4ZMjR/F/aUdQChnFyAiUSJ3Dk3HRacbiglOextDC02gCJv
	JcNTuNrvcbVJJrhwAgAOmSLTYijyzb1bWgyFs5lAbPKpSC7feUcOfwMTfuhiNiffXwDhTaAvdxB
	ogqM/+7jbaUhBGAkfnJ4vG5Jrt6zjIUxN+3a7DCg9h+az5RKEEW/E+rsByPMxNoaPmRbW7wnwvu
	zXyDZiPW7r5MFs+EgopaS8HqUBVIZfbDFgfxWeV63EIwZJQ/RpHK4JHIBDoni5+HsxnDhyXwZDM
	GlmaX7u7kM50PaaZVjHFRXuEwJZZk1DtjOiVOyOiO6BwKk2INyngh5uFCDBJJvyvMM9I2EcZcoz
	kkhu6ZMIhxGP14G4u3X01LerNsXVwMe/2Sir9jFlbOg9hEaOw6bGzPP8EGE786LtIjzawXbPFPt
	WoK0y/e3Vi1fOU=
X-Received: by 2002:a05:6a20:1605:b0:3d1:66cb:d49 with SMTP id adf61e73a8af0-3da39b71971mr16962469637.4.1788588660390;
        Fri, 04 Sep 2026 23:11:00 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.192])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm12653118c88.15.2026.09.04.23.10.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 23:10:59 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] HID: hid-lenovo-go: normalize calibration failure status
Date: Sat,  5 Sep 2026 11:40:54 +0530
Message-ID: <20260905061054.50663-1-mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <205C547F-BF6B-43D3-A8F0-829B657167EC@gmail.com>
References: <205C547F-BF6B-43D3-A8F0-829B657167EC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Derek,

The Stop reply changes based on calibration state. Its status appears to be
the current failure_mask + 1. However, this mask does not always match the
failure mask returned when calibration times out.

Here are some requests and responses from the experiments done:

Joystick calibration:

Left Start:
  05 00 0c 04 03 01 ...

Left Stop:
  05 00 0c 04 03 02 ...

No movement:

Without Stop:
  04 00 a0 02 03 02 02 07 00 ...

With Stop:
  04 00 a0 02 03 02 06 00 00 ...

The timeout error contains deflection 0x01, center 0x02, and turns 0x04.
Stop does not set the center bit, giving mask 0x05 and status 0x06.

One full outer turn, returned to center:

Without Stop:
  04 00 a0 02 03 02 02 06 00 ...

With Stop:
  04 00 a0 02 03 02 05 00 00 ...

The timeout error contains center 0x02 and turns 0x04. Stop does not set the
center bit, giving mask 0x04 and status 0x05.

One full outer turn, then held away from center (right controller):

Without Stop:
  04 00 a0 02 04 02 02 06 00 ...

With Stop:
  04 00 a0 02 04 02 07 00 00 ...

Two full outer turns, then held away from center:

Without Stop:
  04 00 a0 02 03 02 02 02 00 ...

With Stop:
  04 00 a0 02 03 02 03 00 00 ...

Stop with no calibration running:
  04 00 a0 02 03 02 08 00 00 ...

Trigger calibration:

Start:
  05 00 0a 04 03 01 ...

Stop:
  05 00 0a 04 03 02 ...

One full press and release:

Without Stop:
  04 00 a0 02 03 03 02 00 06 ...

With Stop:
  04 00 a0 02 03 03 05 00 00 ...

The nonzero timeout reason byte is 0x06: return 0x02 and press count 0x04.
Stop does not set the return bit, giving mask 0x04 and status 0x05.

Gyroscope calibration:

Start:
  05 00 0e 06 03 01 ...

Stop:
  05 00 0e 06 03 02 ...

Continuous movement:

Without Stop:
  04 00 a0 02 03 01 02 01 00 ...

With Stop:
  04 00 a0 02 03 01 02 02 00 ...

The reason changes from 0x0001 to 0x0002 although no connection change was
made. The cause of this discrepancy is not known.

Successful calibration responses were as expected. The corresponding cases
produced the same outcomes on the other controller where repeated.

Connection-change cases are not yet tested.

Thanks,
Aditya
