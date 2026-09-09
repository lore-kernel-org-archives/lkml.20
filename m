Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5FA2D73A6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788927441; cv=none; b=MOJyoAzlviOMRadEFWc/mRfPxcYQqpnr6YkQ59GYDAexdcoId/XKR6g3cGnWB7PHC19B77dkjHf3Mka7TElzGJwrdOk8l5Zq5PrCX5LaAV+5wtoKMBFLDbU1GFkURXN8CFqt/YnYx3wctBO7vc7yvJ5HCdVSnANvdrmQ8sGb7uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788927441; c=relaxed/simple;
	bh=qVYV97o5l58xlGQ52U9VOgg72HFRjIwE00grEVewmQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mCON3h0sN5GzJsYPxzapTXleKQCg/102IV38p9BQazTiUfgIeZ3gZzO0f3pPfXOtAoxCY77CUxHnr6HweAaR1GzMPAW2DqTIcALHlmd9QIbgG/l0rUYz88Ekz2f3GQzrWNYh4eVOyjNV4M3lp8wfBlZgaHS6WoAfXZNQft/CrUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8nhREy5; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8nhREy5"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so3463373a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788927440; x=1789532240; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qVYV97o5l58xlGQ52U9VOgg72HFRjIwE00grEVewmQU=;
        b=W8nhREy5jMJ/rn7KKY5q03OyIekf6qV5WgerbyIMGK9kYLdPF9NOY+4q8fEs+xXyw1
         m4BpNCK1+MIgD8+Ya4iX8p/TJcbs0w7vhO2tyGgwDEX5Ox9k7syYZBoNlknM46Jr5pzj
         N4SVUNjaQnEH7GFLRbaQOZACun10ASAT8kuiPd7hp5xcW4bKcv/PnekPHjrOort8CPpB
         e0xKZ+3SU2HIbAjVXC+iGhfrobb6B2c0c0vXvJboFPgisB1hqSUgXs2NUviy/HTYcnSf
         uaODAPbkxFi+mGn3/EMce6cTo5A19KRnP1sOXvocDbQnC9WyU94hUJK+PK7W4zcPYniM
         4qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788927440; x=1789532240;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVYV97o5l58xlGQ52U9VOgg72HFRjIwE00grEVewmQU=;
        b=XI3Lsi2o4hJCcGZLNAPBK+rs2gOqP7qWvnJjQdQoDZfTmKgweEw/1jbB6uyrTsrrGE
         ysEmp9ax3W06A6Zd7MOwrwD2iEjDnjPIN2Mvp9deABBbfFpjGcQh+51tO95L+vx0hbPy
         r0J6wmw3BUDfIcIrtk/Ub37rYMjerVqO83lzE1c8OSPsQ+H7Sc6KI4xiATShLnLk7M3j
         PIZaYEQyfGM9KhLJkVD6HORP+P0Pf3fgv0hKIZqm0TQNLBEe5r0ggi6WyrcRX/0/Q4A2
         2p8MKX6xTCYMypSAI91gR5CwTWuUmF9ttuszyxGqwBZZNJC6uX+Vm1atomW2MO1ISc7w
         4DbA==
X-Forwarded-Encrypted: i=1; AKwUvBxTKwVd8rRwF90foKNwJVhNWtUoqiBLQ2JhWOP8Ihwl6/a9Cqk4rCcCzD1UOHp+SXVb1LpmXywRH+5DXAs=@vger.kernel.org
X-Gm-Message-State: AFuF++nnH7Hld8vgO08AsM/CiBTlRr0kY+Tr1I10PJMBonAY2xqYAt3/
	bFWJ7YZGjIuF3+yf3ck9qe6QpbVB7uAEDyNfXmyJRjXOhc4Agn5ycA+z
X-Gm-Gg: AYBFou3ScHHrDh84yUqFBppiKZZa6lXNn/LfpXpOGk66sjtDtNqUa7ApzEJ2YP528rd
	451WYhZWoqn0nZBDMRXuPi9Vk/h+hX+7J88mdtImeaUuCGDJryQG1Kbhxb7y4FGeR7zLF3pauIz
	C77Yc8EN1o9eNfsatIVFrywbHH3lXtbNER4VaZn2ZS1gKU3qZ7TKI0QplsbUNj7iuvTB/FVkv+m
	/6sTbmxHJbkHanxaiJoyPGRPcAxFrGhgxWZxy3V3awwEzleKkbbYFKcLXbZ0onQALjRrnkSzsMV
	l1JObln563YAOtwOftJlB469D7DVxIVJ1UPeSsB0hGE9GfzvVK1VLUjeJmRLyWcpV/LXpKrgMVj
	oTGFK5WRRcUYxENn/XNbpoBmmLKo2aMbhiQ1XkL8IAdwnX27NT+ZGwh8qJb/FfqVfHm8gx2vyMB
	XtqjM5l3c9AlNKCBRDIqZpRPuzsnlv9LVdwc8RFxOueEpcD155wdfM1RKUQhZS8qLsGGeBmKQRu
	QTj
X-Received: by 2002:a17:90b:4fc5:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39b26190c25mr48104394a91.6.1788927439562;
        Tue, 08 Sep 2026 21:17:19 -0700 (PDT)
Received: from [43.242.224.196] ([43.242.224.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm21860832eec.20.2026.09.08.21.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:17:19 -0700 (PDT)
From: Roshan Kumar <roshaen09@gmail.com>
To: linusw@kernel.org, dri-devel@lists.freedesktop.org
Cc: leandro.ribeiro@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 pimyn@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/pl111: Advertise no pixel blending
Date: Wed, 09 Sep 2026 04:17:14 -0000
Message-ID: <178892743413.4104952.10436048272479771765@gmail.com>
In-Reply-To: <20260825105427.686619-1-roshaen09@gmail.com>
References: <20260825105427.686619-1-roshaen09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you, Leandro!

I have applied your Reviewed-by tag to the commit. Since this also fixes
the boot failure behind google/syzkaller#7805 (the ci-qemu2-arm32
instance currently works around it in kernel config), I am hoping
drm-misc can pick this up.
