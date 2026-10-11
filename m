Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FEE2BF3F3
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791701816; cv=none; b=FVu9VtWeJR6iNU9SWDUMxKNJ7q7hD2erOvE/IOANAhTOrlzrIy53/+w3w05r1QOmOujiejB+RZjh7SJJjojRbJ2+RmQ1FWbaP2b6sGX+4VD48xbD/cRn12zqRBODmeLv6TjC1+sAuXuVlMOWXnQY6PCz24/vFg9BeLXQdBz66IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791701816; c=relaxed/simple;
	bh=fDE4sjBCf6KBhIN7FPxf9GKlujuXFpeef/dfWosmNns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOXxXeiwhIzIS61xQHeUxGhbbpcqTyqoI5ir0N3PiiG83UKRJZlSnEu4pe9KNW9DrbofsssLIuk2CvYp/ch7moxFmVfE/Oc7bU3lAcnA+rV4OdY9qvperF5F91YnGD3zSrwoylZrENzwnncYxXIJSLkBXAS+r07fNHnLwmtXW5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBk9K/Wf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBk9K/Wf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so5639055e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791701814; x=1792306614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDE4sjBCf6KBhIN7FPxf9GKlujuXFpeef/dfWosmNns=;
        b=cBk9K/WfUDTDljxiQKjOwDao+XllpcUQuVHUSpW/ya71y00FVbBsCghS6ADRkKpluF
         yx+zz1fZmfeXLOa4g/KohzfUD/SAmZSgjH9Mg1aW3dutUKiKfdZyGxnUmWESdhDMPVD2
         6FjNxSwNtpKToWcR/LGq8AlPnqxR5/Ypwlh/c3wb7XnJIEBL7ntDh5k3qh4PQhGcADl4
         j/1aaqxDqaRyZ+DOj62rCmg0pe+gmhPd9rlCzMnylhL8YQQNlysMu42ITrjxj0qDjzRk
         PibUhqlC+F6U1ysE83cjHJDQjx4dTFeNHanIyW5Ic5OuUDvaBvvHki1RBGk3RVOZKjuT
         5uMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791701814; x=1792306614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDE4sjBCf6KBhIN7FPxf9GKlujuXFpeef/dfWosmNns=;
        b=LrBUyxcH/pfLno/r6I17g13nqqM6oM0XUoqwewX206KpiNjKveQp403YUGOvdVmfgs
         pzhFWs1xnFe8ilIIfE0ajHL/2LWXjFTLMNqLCoulkWMAxs1W+VpdW86OiUZYij82z09u
         OanXkvtDJ+ZYqbJTnw8xiOhg90D12VfWfiSpYNXWP+ucC1TN4XaIutojP19BOA75KXc6
         qPtDJHzJq3ItLCK4YN5d5AFD2gO8/CtZtr/68PHvZcT7agKOufglPyiCrIdy+sKLZsjR
         YlcsUMLcUktthPQtQW6SIl6q3No4jhOLEkpf55GG9TVbkydFLuALZ5jVHJmCe6TED8RF
         oFGA==
X-Forwarded-Encrypted: i=1; AKwUvBzCxqBL9eu9ODMnjDe9QEZiKSJdyR0GRqngVBHEIPvW1DDQjpzHs+dClaMoaWpM2/pZWCbFp8WKwrJTakg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkQ4bMtKUsOdAMzkiP2n4ltNliXevJTXIbb3CHszr3gSKVK6tV
	bN1czXTJa94woUAQ3PXewvHAFOx+SPv/tCM+mCjbhvmH6R+4LXUmYhU7
X-Gm-Gg: AYBFou3EH7afF/wb8+dxWjQea4r/dK0qAZEaoQhfER4DRKnq6G+v25S070GMSLULUWc
	39spC/kuI3lmAuvp6eZQ7Cv61iya9664YyF6zwcXEpWxetFHRZ0CDbzu2XQsqk6QFUZyFcQpfV0
	fcGq3gU2i4yvAWHeg7rxyLru40yPcz6HQyNAt/fz5VFNLxIKCuXMFqqkaGkwMsOFJUnce16wHcL
	R4l4O0UuouZfUsfrJj9n54DH96SWezlJqmu3/M5odau5WnwG1Lpivv5D5pn5XNZf6W6DclwaGYM
	Dxp7UPchrnkXyMEEOCAroJrIho4Nfrv+qRR19UKGxCjI+tiFxsNTbnCQDIvNsKUTpZbxDvARgIA
	L4lSkYRDa0EWnvIDV0w/SBU6z0thcqgeTMpZ0UxZLFPx/fMhl/UZjs2UrhyhRlx6q9Xt/6VL66v
	rsK5GHmDuo6Zj04hgKo0TS/hnfTTC5yYv5S97fwDu/gLBYobz440WOf6GWaJTo3LB9krJAPhXEA
	IijffKFMp/O6w+Bpyd7BdsnmqRyK8WdPJp5Ojm2BVK/6CmcrgynPBdmpTiK5E3YxcAHH/XlNVMC
	ZBDRKB1w3iNhtY5T
X-Received: by 2002:a05:600c:524d:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a18e446461mr123133175e9.3.1791701813668;
        Sat, 10 Oct 2026 23:56:53 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm257500135e9.0.2026.10.10.23.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:56:53 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: octeon-hcd: keep SOF interrupts while a periodic pipe is due
Date: Sun, 11 Oct 2026 06:56:51 +0000
Message-ID: <20261011065652.2374071-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915081724.25637-1-orgads@gmail.com>
References: <20260915081724.25637-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

A gentle ping on this one. It fixes aebbc7d63407 ("usb: octeon-hcd: sleep
on an hrtimer for far-off periodic transfers"), which came in with the
usb-7.3-rc6 pull, so 7.3 will ship with the regression unless this is
picked up: a periodic pipe that is due but could not be started can wait
up to a second for the next SOF.

If it looks fine, could it go to Linus through usb-linus? If you would
like anything changed, I will respin.

Thanks,
Orgad
