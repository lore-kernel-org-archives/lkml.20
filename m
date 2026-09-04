Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31341D13D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513073; cv=none; b=TqmFyOV5deF+2m86p2YlZTMMlTs+VaX1Xp3Iw8EU9Qy1QzpiFGvFy7R8GmRZFSP4aEJdyZIuCh9FSwZ95Sbc1Cr5GpavGIN8KI/j+dg+A5/I8KsCSRR/8OqHYJXALM6pwGRUL0YnPMN1GJrHBzb4Qs95JiiAb62NZzY7Jp4M6dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513073; c=relaxed/simple;
	bh=aSJoHDgsqCGyR06J/jLVHcy8zkUYWVN9c517RlIo/VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZOndMaeB1BXjP1bIl+123iaMq5R4inxqsUPRDduN4qpPTR9rGo2ZzEzOWkeqXbFLfU1SWmhSGK8NpeUeSA8SAqKVNu3UDju9jAG6nOWy/Iytpr2Kpf41cbnHyRb8t08HoEuq6x2eXUE6VzkfF3oqPvWgR5V6kmb7KZXJQN+S4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOuS1RD0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOuS1RD0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d9201076b3so9900585ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513072; x=1789117872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSJoHDgsqCGyR06J/jLVHcy8zkUYWVN9c517RlIo/VI=;
        b=AOuS1RD0cO48FkUnpiogfKykYOquu2mA/96v4xfSM9kjzqjDrgOBM7c63d4VnonOKz
         ASAv7yhoLrlhDDtpzPuJ60eEl2JwXmoiIPt4GAg+tqAJKkMYNa//d7Ru0g3hPL+ucGc5
         HA2VAEGVAhoFsf5vaRn7taebzhEJfgix6LorGWVIrbQLqUUuy7ygyxTlmL+khhwOe3VS
         AChpqGsZZfb0W5i9DfIDEjKQm+5hOCSwyloxELSPYpzq3qUhc8eHLLSKlmwd9bkeKOXP
         sLmAFBOrPE8ypYa+JQPdCRBZydv60x6nxkHwkE5qO37P8Sly3roJJeYltatSw8JB/pKm
         V5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513072; x=1789117872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSJoHDgsqCGyR06J/jLVHcy8zkUYWVN9c517RlIo/VI=;
        b=fR2b8BQcK+SdRiBxfTwlWeNHn38U5J7lMrR1NOIkzZMfe6w5C2nBQHZDlYXQrllERd
         KQcP03i4eX6pBH31pA/Ma/ivkqk3yffG7qhQBqyxO++WNqpQs25ZWFn5/vfky6KR7P/s
         0BLnTIsJljzk5GM5SmdiX4dsN9uVCHa5d7cEHNyntQkQdwuZLK5kmzZCxwLnhIKWpeub
         ybt/wWc1xkkx4j0Kf6hmpwuDylf98jp9hxAU3u5mUnGaZNE7WdJlKbviKrFmgztYt8fU
         JbuVASnlUf6MIh/xLAhSDFTQcm4RSvR+debpD4Wu7sChcrDi0Zxn9bX8Ciiprlh1FtIe
         WNQA==
X-Forwarded-Encrypted: i=1; AKwUvBzS6iSOPGyNdKZC5wHriUYNcgIvL25fttBhOvzmpWLhIkBqbPRJAlweTb4y91XFEfKre7fWyGFQhN2zSlc=@vger.kernel.org
X-Gm-Message-State: AFuF++mID/BG2RaT11UAMkuQxotPAfBwMK5NZo5qESbdlM53A7aiIHoH
	e23hzvV09b17jJr9bZSfyU9lKICugxxbyJO9+/oXveChvcAKhx+i4ts=
X-Gm-Gg: AYBFou0bVhsCQbmqekgnA01kD+8ahuM4ZNPrQ1KENC3QDTCfjes95UnTDzMBBJVy0Ox
	+3EsCqhIRfr8O4ZdyQAqtHVXEtJxfjpspCLMBz0Z914RWhhwvPzW1uCPlvz5mUDPsH/eIcgLpBc
	3/xMAa9neBAlWxv0XWBPO6tZxz/pKKsH/meE2dmEve1VlDF9HyW4GqDgc069ypPTrKPvbVSkjw/
	kDBjJtbawajUyL8GmBPTqRwv5ipyLBUqR+aXuB4dHcwzxIQ2diQnnud27GyRe1qS+fEXU8DAXUK
	auMeKqGC3KMiVsCxjQM/2abqrUo+17txiG0PtHF/HDUc8w8/zpHu+e9lpfYZruVNyas9zwNNzf0
	/6Ur4++8MNWSh0uKq38RCDFrMkIEsp5HbvAm3GJVr9MpRLbikftbmnffzkOWfjJFv22NwKFwaeB
	s3fk4n080FIy4A2bpbifLf58L98NTX7Eli6IW0PWTnqEVh5mCk55LzSVbagdJuxVvey4kQYMv+l
	m6sqyeLE4ns7xktAIqO72Nl8Mo=
X-Received: by 2002:a17:903:3c70:b0:2d8:d2bd:a111 with SMTP id d9443c01a7336-2db1248cb72mr77818745ad.6.1788513071618;
        Fri, 04 Sep 2026 02:11:11 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d455sm7163185ad.30.2026.09.04.02.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:11:10 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: phasta@kernel.org,
	christian.koenig@amd.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com
Subject: Re: [PATCH v4 1/3] drm/sched: cache the timeline name to fix a use-after-free
Date: Fri,  4 Sep 2026 18:11:06 +0900
Message-ID: <20260904091106.2186243-1-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <196070b75705e9bc38106c235dab75e92d98cb2b.camel@mailbox.org>
References: <20260904080618.2098450-2-malhyuk97@gmail.com> <196070b75705e9bc38106c235dab75e92d98cb2b.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2026-09-04 at 10:39 +0200, Philipp Stanner wrote:
> Please wait a bit until we discussed it for a bit.

Understood. No respin from me until you and Christian have settled the
direction.

> Do you generate part of your mails with an LLM? It seems to be a huge
> corpus for 11min of time between receiving and answer

Yes, I draft them with LLM assistance. I should have said so up front,
sorry. What I do not delegate is the checking: I verify the claims against
the tree before sending, and I am answerable for whatever goes out under my
name. The bug report itself came out of my own KASAN testing.

Your point about the volume is fair, and there is a concrete example of why
you are right to push back. In the v4 commit message I asserted that "every
in-tree driver passes a string literal". That is wrong: panthor kasprintf()s
the name (panthor_sched.c:3591) and kfree()s it in group_free_queue(). So
Christian's objection to caching holds for an in-tree driver today, not just
in theory, and I should have caught that before sending rather than after.
I will keep the mails shorter and slower.

Tvrtko, thanks for the quick answer on the tracepoints - the comment makes it
clear those call sites are fine, so I will drop that point.

Jonghyuk
