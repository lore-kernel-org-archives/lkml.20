Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D646532A3DA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789270365; cv=none; b=UhuIkeeohu62Zq98wwElVJxrcxEIAoJ5jn+eorEFndXOwJQfoCLMRYVgb/al+hsGxO62pWYLgva7lIRGb14HVdFnoWz4z0QbV6iKeEzB12YnErcmP0YTW/S3L3UikI18t6xygcpSk2Gimi1hpu8Kax+bP4X6bCgI2+thsW8vM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789270365; c=relaxed/simple;
	bh=kCvbVwZC83we+errokyP7K643YD3vh2QxPQNw/0AuPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sO2J4y9hUY+GVl87hsKxcU6NanoGVZQ38Ebwix+/Hi2SO86OSj7YomwOmIfu4rme1sL1uYMXJ2rZIooHbnAfZtzEwdgoevMova5pt04nUUB80RgTx2RP7Vd1GjEM0BnMZpQgzFlEPL0UNH8bRukwxHaOrhWjHWzsZyfkjDUM0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxzJVUzP; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxzJVUzP"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a20367cf82so18098291fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270362; x=1789875162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMZTr/1imyQVYMPCbe2CDQylZItl7GAC+PPMeDYEaLA=;
        b=YxzJVUzPcOQO3IPLgJihQI2ShRUZ9nIZriqRkItz3cW5PrtidhOdIP1UI3ICDRwuz0
         RfWHzWKQtASqBjKJ+9OEHRBdEeOu6Q08YPpfMfaV8VoJBTylgqTK6ZrEZv5ml22ELsO9
         SkSNooaMJPzSdOmtSOg25zOWT9/l1JziyaAVkHsoTguN42t2zJbCHBeJqGxDpkAcfs2I
         jriUsr+BNIVeoZVDdElg+RghWAcImwCbBtVi0ZZVlipZXogecGtPvRJAbnTPQMBGYFXk
         tYX3hg0vYQn28RSUInppjeoadW7q37kxAwcbNoW9PNOzOAX0LLDEvN+QMzDVOSUtAy2d
         BYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270362; x=1789875162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMZTr/1imyQVYMPCbe2CDQylZItl7GAC+PPMeDYEaLA=;
        b=U/38RCq3ILL0i57yXA/y8X1DqLOzF1uo3xyfrP/BXsccGWQbhlqgFN1+VpIEnafjRA
         d6r1XNyv6TzxBDfsCtWnMHxnrreuwF4cDbfrB4heC5mAE/sKQBGmi6RCTzcigYtuSybs
         Uy9qQ1zNhjMvQFhn3wgylRVmKpQgRftG4sJQhyAy/StInPezFBAiMQ1PJ4b9QrWhTKi4
         PP4xwKfuCM87ZZwA5r8zTzlflVHKlpBg5IPtsBCvmoiGWLFkqnvHrU5OtCsvcIU+PdB9
         UVUlLfym+yEiRTS2Pg9jSwM5+m7eu4Vbo8JVWUKNka0yg/LSLReMZmOzOuStdcdZ5wXw
         WzJg==
X-Forwarded-Encrypted: i=1; AKwUvBw/TFNla3ZT1Y8WQ1FgVjrE3Fr1qkb9L9fUgJ6fKtzmPV5dvBSTt+dMz5QT8cFefUfqd0apy+WabSIJwCg=@vger.kernel.org
X-Gm-Message-State: AFuF++kIJNI+jm5E8XHBsfHF28aNl+hYGLyGbQ5HFXhu51UxtriJ6Faj
	ZXNHUZRA/4E4epzzeSaLXLXuGBqo1dQKOeVnBFFXjO18mKH8Fy8yNDZ9
X-Gm-Gg: AYBFou10SJmpGHMMxUQuTr4bOdYz5gQksedrysPqCTiAwG0O7X2S0Zr0oXZ/h88cmvn
	TisszyiRPio/dH6SJ3uR8ii0sl+wJriqVmFL72F0l8BaFze1qYZFB23nZZ9Cpo2JUUETiVzRWZd
	PGXHUBxbFusdcNnHvID20ufb9BG9aJPsQ5l0fEaXeJ3EO2ohxy0shCDFIiISFVKZ9B/wRdZeDLs
	QQSVmV8S4eX/MfadamOoYqYAYam7z19t6zABskUr4le6xpwEO6SoZGju7BieNuflDQ0qkKFjvJg
	H/oHEpATgA/lrf3UQ1DGVztOYFxcfslFYmi2HwdDxHkPotg/+OLJQqVTir6U+thLQZ/D2YqCbD4
	BYCHTHXdBZI4I8OR/6SJva647hZiku34RCI2/mz67g7IIduWuZYgvQ9CZG/gNq8edR7RYgKFsI9
	Rt/rrjQW+mgpQK9ZjYSLZc41h5Zly6OWDRKyHNyZySaGdQTOyaQi+oDHiw+vnJB8irI7LqgfoTw
	JKYV/CErDbQ8xO/22NHr6TMLr0CvfIBKEoqVjHOFPxi
X-Received: by 2002:a05:651c:19a0:b0:3a4:d4de:bad0 with SMTP id 38308e7fff4ca-3a5a5022d47mr13760621fa.19.1789270361516;
        Sat, 12 Sep 2026 20:32:41 -0700 (PDT)
Received: from dau-home-pc.. ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33a1cd1sm17024041fa.42.2026.09.12.20.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:32:39 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 01/11] ip_tunnel: add drop reasons to the generic RX path
Date: Sun, 13 Sep 2026 06:31:52 +0300
Message-ID: <20260913033213.873609-2-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902184718.64ddca2d@kernel.org>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com> <20260831215137.549324-2-littlesmilingcloud@gmail.com> <20260902184718.64ddca2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:47:18 -0700 Jakub Kicinski wrote:
> > +	SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH,  
> 
> This name is way too long, maybe
> 
> 	SKB_DROP_REASON_TNL_CFG_MISMATCH,
> 
> or
> 
> 	SKB_DROP_REASON_TNL_OPT_MISMATCH,

It was the longest name in the whole list, so fair enough.

Took TNL_OPT_MISMATCH in v2: what gets compared is the options the
packet carries against the ones the tunnel is configured for, not the
configuration as a whole.

I also renamed the two other reasons this series adds for the generic
paths, IP_TUNNEL_OLD_SEQ and IP_TUNNEL_ENCAP, to TNL_OLD_SEQ and
TNL_ENCAP, so that the three do not end up split over two prefixes.
The GRE specific ones keep the GRE_ prefix, next to the VXLAN_ ones.
