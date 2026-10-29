Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286659;
	b=gkTafy8KpomM4l/BWslORTeBiElln8Tvhxlhgid/68SJ8Fh93QkhWuaNmg52+Ee7wnzU
	 15Jh891kxe3d6yWs9q6gl1IZLO1hl6cI9Giv/uumWMHfkK4hej71aUsDPgko71VjYiOqo
	 IVJDoom+g6gMBjZlaaI9/4/osdIIvsJHuHvqd7qIfukFwz/dkkHq0xVFdamgqnPchjz02
	 c636O1nNfYXPxkfYDmM7ikftPpnSH4g07CMf6TDrO3CJToQFFCuI2Dr/7QEj9M2T3uFi1
	 aNXfqnbH0mMgowb5XfUUUSfXZ4uf3C+eEhzrm28vqtqLfl7cI2TfK2QpEXY5bPA2/ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G8cNe0vIDRqZFn4+nV+82o9Gia0vdZIXG/CoMPVcrRk=;
	b=Bss7ArYwzMD8wQu9zrfRMuiIPTXwvUzDi3XB1QT/NPidS9GsEUFOs2LUP4bEctiRtXas
	 6AbR6SJ/PyvI14kDveoHNWEf7Svb8SYgzYlMT7dnoDgJqdA1lknrnB+s/UYgSvXDwktq/
	 f39Y4l1kw4Spg/TNNZiLcGHZHB9UWN+vQH0B+BqMFPbmeTBixFDJMxDk1CtFBOMX7NGYN
	 8eXcOJ98Q6ODPmtuxrt+B/l+r63UxqUgU7abY8eyacC7/Nqs4YPtFpcm41//vzt5sX4Wr
	 NSm3aCSJYqAM/3bPIbx1bxAv22JitruysbfNU+trrGmGeOrLOyADru8B+wvYrjpnOXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpQqGpjW;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E76606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpQqGpjW
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so2538648c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793286658; x=1793891458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8cNe0vIDRqZFn4+nV+82o9Gia0vdZIXG/CoMPVcrRk=;
        b=WpQqGpjW+ZTfSHK0//mGHKzJyuHbZ7C9dLgAuRjn/zP8brmYCt8mCzMLoSj/FXaDjk
         sNSJuq9gkdWMPJ32BuJHZqdT8WCo9oCZVUGqk26bKiEx/3PMMIhjyzjcr4JfYI7FsFLu
         Cq79BHQPD2UgZXv7AMOvewB4vnhxNaMxhssAO0IMYT/DvQxV7FB06+M6dpusB2gAiisp
         jRE+ru1Tw8aJHIrkNMcHly6I0escIRdsrsmFMkS3dsa0CMb7CeI2IbG9AA5He7PXim96
         VEB26AhbLZk9oJWwscKOga8Snu5CLj+NIMNs+3N+eWy18dh1O6jXO0ixjnZbyqt0NfB5
         J3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286658; x=1793891458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8cNe0vIDRqZFn4+nV+82o9Gia0vdZIXG/CoMPVcrRk=;
        b=UPBTtmVOgRoLj6w9pG6csTWSAPHp4jem8N6efX0s0V/7PHa5Vnym1US90Ql7xBUNaH
         a5y3sW65+AhEVyzcZYXQa26DVcnnhveuHHNa7pMceYcNhlzDO1KeMHzEPendIuRF3Vs0
         CJprq5jMbmlf0hNDSOXvMCwIFwJOywmj3kbaZ+vtXW35jPJWBWgIlZ7NsHSLFSsk6zKI
         BYjVScMyYQMq9r5x9LbUtbOGOR/nPsCOy3GaAoxP52/WvHLoBAJiWGRnK7R8URde6RLP
         0W+dsJh+fyGzhUpfcDZZSZFOMyFl12q6fsnXGDmHc/+IWXcnKguskEUn/UUJ7G0Xsv9T
         U9Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxVD7T5wTcHVhHvS1eiu5KbKtmCurfxxVApewO/upK/wZhk1tc5MWy6dPlyhqH6a/fVp+Qw3+ETjzlnwXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAMxB0yjNUjyQvYJSBAb3ZHjZ9iFMTe6A+pQGaznBXIehwxhW2
	v90iuGU/HfGy/AamyrttyMuUk31DUikHvjkJLhlD8VJeN1OdKH7mKdY=
X-Gm-Gg: AYBFou0K3hItITtp7fQlt3Qg142slg2nhoD1J0i2zZMIFhQzI4c7iVxJr/UDRWYDb1w
	xDlChoToRn0Y8YYeTjYVHrEqv+li8nKmg1zS7ah6w3xC2LlHeM4hJmAH951H4lc5NeGg3xplF4U
	ZSnS0/bfYTEi5ecjKAGlOb+PF9xxnxhlNOa/LhIfgjEIRBWKv81tERZ/Xz+Wom3hO/N/gfvUaip
	1BilS0bArBSXBncMIOlJbnZvcv31d+tc0lHNP66fb+4PgsAOhRf8mM2V+UWF7HorbCDdoX7NFob
	A68n6gaRE+dWGHlhbVmbW97Xr4tTqYauC2mmJedCwEzUQM0sgn29XdIzEGDUov5suvDrXCPudpq
	Sl93s9jEiSIXbi+Ig4Jv5GSKLRk2QLDubSAck18X2YzclzRSDl5g8As/0+K7CCOaixQr4m2h6+e
	iwACkaaOLlo+NdotXtH6Mn8qZiSGr6B+e+rIXtYba9S40cb/wzDs0Ey6SJZa7WqzsGbutcu7c2b
	6B9Sq2tYmlUe1Ilo/gAnPPp7kimONApIfwgNMBuZO5MZTs+8+iyZfjue2OHW0K1+VRvf4R9RvfK
	kWQBn33GXlP/EKp3zWXuJfrwA8cPwKo+J0x3Qvp6MO6cCgvCFWm2DMOPHfHpT14dug==
X-Received: by 2002:a05:7022:f50f:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1a6c9cda82bmr7738949c88.2.1793286657636;
        Thu, 29 Oct 2026 08:10:57 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm27327662c88.14.2026.10.29.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:10:57 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: atharvatiwarilinuxdev@gmail.com
Cc: lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org
Subject: Re: [PATCH RESEND] ACPI: processor: Use Apple-specific methods for P/C-states
Date: Thu, 29 Oct 2026 11:10:51 -0400
Message-ID: <20261029151051.1124-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015204450.1270-1-atharvatiwarilinuxdev@gmail.com>
References: <20261015204450.1270-1-atharvatiwarilinuxdev@gmail.com>
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

Hi can i please get a update on this, i sent this patch almost 15 days
ago.

Thanks.
