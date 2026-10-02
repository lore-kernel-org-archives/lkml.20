Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3966D3E49CA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972927; cv=none; b=H525eXQ99GNs7ZM1GpZ4t+hclfZvptqQx8mJPO5YLxLp32wMdkRUcoYI4MPaDyNYOkl4FTrqVObW27RG3JdvnN3n4q6bEvbp4Mps14fUHK/YpsmU79Q1CbQw255ox7dGiLxx0SW5zo/+OiHG6GLFasLGP2KRppHgdTe26tSuT4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972927; c=relaxed/simple;
	bh=D8X1XlYV1xq+RxSSILgm+MOm5JovS9lyKgYPVNdN+s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIWAMKSxfFFmWGast/pIBIwexud+mAceO53k4YhlTKz3WHBo7E6qzZqPjNLvZx9SS/W8enaPJODIIu56xLpo5r0r9fkiaoFZM14dvOWGugnzHhZa4cNKsqLAhxmT9iFtxBkSPVNCjDKs4jzDu/UmDSHebkEoTJzonCOKgOZtHTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GO3qDnV0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GO3qDnV0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so1707025e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790972924; x=1791577724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8X1XlYV1xq+RxSSILgm+MOm5JovS9lyKgYPVNdN+s0=;
        b=GO3qDnV0dYMmoFyyJqpNAYbapJBvvuhHH0gvbIWTIEwmvpHXI2HN4agDqg64BUU3yb
         vgVSdzmKd70AoHapXrrSwaXh7w2EvK7TWHEP8iBQyGCNdxXO18C0fN/DEkVC7a0MmZ2r
         VUGL8aUkUZPZFd/99/aHvbYLO2rN3St0FiRK/2iwyrcSjaS6BCgPR6quMz2zvCgdY92b
         Y0oso/psnb7xYyTP1lqjv2gyA0geb8d5QUD6kzSOor2IGV8suTP330FyCh77zkeOrEG6
         R8Q5sQEsp2hWYpUoCofpPeRu3cCwO5xXG76nHqe03w9OhBZlOO7F15hZqVpXPg/VdQ/x
         Iw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972924; x=1791577724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8X1XlYV1xq+RxSSILgm+MOm5JovS9lyKgYPVNdN+s0=;
        b=BUFNn0ejkZsFEA4G15W15RLBKA1Dsk/gSkJt9bqtjrpDq/Md7tHxJ5k/ltvcGi4R5K
         1TPYm15kiXWaqk64ZH+L2vaRxlWJC9dnAFAprIf1yc9FWGbnPRGQN/HQc+pDgT/IgEoJ
         QbjWVy8iTkyAlAGnUURFxBoqVCa2Ak8C139D0IehvVNh/Z/dbq/EJClPdMYmwGiW+e/j
         1ElXWFRksgHvcT3ScLUefqLDKvtQ3+1xhWR1QXT0g567sIBeMeo4/Se8zRNbIVZ8UjpA
         I2JHaVPEyiqd2hk+A7rllldUKB9ROPVFEf7r100oOch+YVYNBZ8ejwhJwprgxbyXkrUe
         0H3A==
X-Forwarded-Encrypted: i=1; AKwUvByG7AfScJ6G/e4UxYi4+LPWVYnF2vfER2lI7zZGPa/ffQlmYjhpB6CgZlDu0cvn7381kHqpy6W1alZgSmc=@vger.kernel.org
X-Gm-Message-State: AFuF++nrqFoE+RaAuzOMAPaG3O1xRPsUXICug+ju9akYhZJ2qXUU0W2+
	4uC0BsMjCeU2Cud+b/sl/rb8th6qP4osqaYHT1aBYUj6OApPzRLv+ah/
X-Gm-Gg: AYBFou13am/Dw2TPocSe3iqgVDD5tvQ3jDAYSx09DsuwdyvQcPZp5/bpN5Wmo5lYqW2
	no9JNHCqMAsEOcwzgUKOdLaTrRN0tGF8vAZAGVxM8YsPMdB3X4gMN9xDvBtJq6Gd+NOyxTm28ry
	v89IkhtYOj2bGbbcXuGyg+TLG3e/UfyPlRZnN4wcu1ZST2K0uHHrMmukrQIQO4s7i/0x/KXMhWE
	l6IadogOdbOr92R09xdBKjagyY26D7Y/bJ+EEq1/F2nZYalFhf3cXgXoMUCd+/Oq62c9a2EBEz7
	0Gs6nYb8kDlq+q+8NSn4rRJNBiosFPc6hkMRALwCPIy9JxVSDKq4W9py8IoiOdWU6fUyXbnbp3D
	OmwiLGdFq3PTx6I0KqvLQwATJzBgZ4lyO8gvVS9mn0kCfE1kpQIXoFuWw2vk15vTrkOEMxKrmzo
	LHMAEKrKtB97gaT2jIz79xBJYcJ/fOSB2pBc0hl2MJM4ijqeOZZE2M1PqBI8DB99Ov1hRO2PYPV
	8l3Y+8dJaar1S4Vm+3/zkNWD17qkkXN+8qphq8iMmIIV8hL4iaB/Y85AtS6gEyyCu/xzxDxrZ7b
	MyjB2g==
X-Received: by 2002:a05:600c:698d:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-4a1680e5865mr7295435e9.14.1790972924299;
        Fri, 02 Oct 2026 13:28:44 -0700 (PDT)
Received: from arch ([37.142.150.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c84a9sm97832585e9.10.2026.10.02.13.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:28:43 -0700 (PDT)
From: Aviv Vaknin <vaknins33@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pid_namespace: make zap_pid_ns_processes() freezable
Date: Fri,  2 Oct 2026 23:28:41 +0300
Message-ID: <20261002202841.3434087-1-vaknins33@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAJZ5v0jQgroKLxnyeKLedZvc9f7k0OLhHAwpHjvWK1E1BHDq2A@mail.gmail.com>
References: <CAJZ5v0jQgroKLxnyeKLedZvc9f7k0OLhHAwpHjvWK1E1BHDq2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 2, 2026 at 8:13 PM Rafael J. Wysocki (Intel) <rafael@kernel.org> wrote:
> Yes, it looks simpler and it should actually work.
>
> Aviv, what do you think?

Agreed, it's simpler and avoids the extra try_to_freeze(). I've sent v2
with that change and without the comments:

https://lore.kernel.org/r/20261002202820.3433318-1-vaknins33@gmail.com

Thanks Oleg and Rafael for the review.

Aviv
