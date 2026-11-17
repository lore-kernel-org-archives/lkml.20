Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906642;
	b=cb4+TUiXKeDqxFhkroZRkw8T1qjwfP2jhpzXkhUAk7OPV1nAaEvPm9gyKBaPLQB10jyz
	 vSob695qzn/RfC+k1Lcv8cwEzAuIFT4tCAAsUahrxX578D2SdrNM35kfEs5k1MgLglpN3
	 pRKB7sBGUqoMrlNcoF7vXBJH6x655rvCxyA4Pdvy/8d+ZAqqzpjKd9qDIZOL8vmHajf7y
	 6h8a5pyV+jjZd6+mG6KhTPi5xRG69sDuhtfNYuSYZ2DN5QheD+veZtuIm2NeIiW9IfSsd
	 MybPiOhZmVuVtoaZ4tl5oDcxWjOlPITmY1x/wiGTpGvMiYy1fSHvsKFkdx0d1I1mlOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qU+9OGvRfJV1audZnO5SC1P0nvA1K8+fKrFIUfplFUM=;
	b=5owIZeNLc9EG/ZBLQSfw6Jb3dXEjy0GOtvdvl4dASwFKsaJ6y4y+GpHxvrS7fU8n41mg
	 Kv7O0YNUmMCCKXp8bALxOTeahedsaBRQPhBRGiXHhMr4JPLHDV5EOHS/zKXRY4RH8QeGW
	 LKkGYnzl3txlPfSrRYtQZNYwkLqZdBSdJl9DTIwI1lABKmJK0ozilKMbUVCgwFHdjoLAP
	 sdYmJeOys8WZQ92Ktu071H6NPtES2ZbguBesc1VMThAItfjJBCoPpFvF8l2akRGflxmjI
	 zqH7dqzOXYvqG9fu8ur7qklqqqfh9OagoPjrLO6ZOrY4j3khpd88rRFpD5RM0kERgHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IY7t+LAO;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD0606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DD0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IY7t+LAO
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ea7987517aso29975685ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906641; x=1795511441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qU+9OGvRfJV1audZnO5SC1P0nvA1K8+fKrFIUfplFUM=;
        b=IY7t+LAOb6XWNzzWCVC75cn46512CDirFSZ595tS/vBxXvnW7VtypiCoemppHn65KE
         r5+0Gx13IgBFWk6VdV6iXgguyZULkmTxv/+C2nu1Yy5NhSns3nkNERhjl0cAtGLXPs7q
         brRFF+CZ5Fub+hRiQi3FtrJmKx55qqvw6sNGdqGec6MDnoAVpdtvsAeZguNFA2iXBDMP
         00IuewHX28K7FfJEeWyncTcxAbtwbD5h/mfHKy9n7r0n2G9cRHdRn17TVLpP2kelvj/F
         xsyWK/gxkRy0nGi/7BaPeJUhZHqRlIU3dG/tc3vR9oOVniNjB0wJWZCBSNl/Kc3l0f5H
         IyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906641; x=1795511441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qU+9OGvRfJV1audZnO5SC1P0nvA1K8+fKrFIUfplFUM=;
        b=vjCul+5gd9sgJZdQXUYz9tXRDRJs3sAt0fTxr6Na1Pj9h4zZbMrWksAV2D9yYTBevi
         0ll3j48w9yyhfs3IK27eLyQoD/HN/rYWgBSFMScdlZnc8jWOp/+kv1jMJTsfd/dd76Su
         zMrKOJQpqCio+S1XjsQFGx2ONm0y1G4MpcgdiBRQDsZh+ruITFictFhFQNT9gTAF8Onx
         2KGL26J2VQzb5lyJv1fQNOi4juWurZTmiLbQWlq2BD0xj5u1+cOk9504C8GyYLltrZlM
         mQAz8ep0qvf5VNrzISDygFNtEnugOvAhqm6501Mn4zTi70Q9rU9QSA0Fba1C5CGcbvjh
         5YZA==
X-Forwarded-Encrypted: i=1; AL+hErHmtK32bK7yAUh4MEFlIuw1WAvfV7nvJLmiktJLh9kWHml564sPkkhND4wNJXZp/tF4bJPbVSV0FgmF9Kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o1hzvjEz9SdEd33/QdNZdD6M1bSsmpwI9dfxjT1apsorYozys
	TuSz5YcWouaHTOCU4E5BDmQenV/+0dcitbwvm7dGEGmnVNz/rwpI7PJk
X-Gm-Gg: AZFdTZdc3Ej2OUD3spDaULX6bisg247FfW746TJFh9IE0LOJgzpzPeZ5L2VvOm6J1GQ
	NkK34BNxJzg+OtXexWLk/N3jYf/QIw1+L8P5ZV+laub/tHMgfL9kMG1r29oP5Ew6NMbpwtGVuYy
	Mn3uXSjlyAoe7Eh4WsIRBS85ltm0sd7iNnInAzBMNNl1aPZrMXVvd0aFhzDE0bpjijGIWNQPEnP
	/Fzi9/DuPRrnLB6zxQkRUXqjlbEMk8N6cSlp79XN+SesWzJefpppR2bkoZF86si8+oAp8LkgKXm
	ZlKf0hu3nsoctnGMuBLLjmEGrAdcTMFDPxMJztDn8sS6d8mKKqBqnZ7+lRPasD6v/pQj+yRAdde
	B3TJ+o9eTN+vrHLnvMNuu5qB4svqNfBTsCTghJxVf/gTJUSsEvtzu4NwuuDgdjKrLGi1t14H6Hh
	56K2+La1gjdKDFjd+Ik8AsGJXchX/2IIINxjwMcOso2lRFdbXZNgNhr9LqvE9PSKA2O6o6HWtxs
	TMijFym67TgIH9/kGZ0Sjo0JtSxoBR4ozSTYObOdh3uBna1hQfPERfDzhQ/AG8Pl7dLxOKbhSUi
	/XyTBcmJOd43Z7YhnmWyxGRLvArKwSAbAED/lDXPY7nNIqzsieKBLSe2AVk74PieXL8elVblS8O
	m+OlRZkwsHmbwETUG/oMHAMVSx3jftqhW9W/tleJYShdHYy9Vxz4aLNiY86hBuWPJXPirw12ACQ
	imMuV5SYjzkF3yPox8DB68HW6XD5RDpzq70lvSH90paEDX1y14AWPD9/wEVitdCfL24FmqmxDGB
	NGlQQUQYyIkLvRqHeWTtQ+JnPl/shJKVPK8dlzWnz3qG57fEay1QatvAXF8/wa/
X-Received: by 2002:a17:903:390d:b0:2e9:5507:b532 with SMTP id d9443c01a7336-2ee0dc5d126mr124593155ad.43.1794906640821;
        Tue, 17 Nov 2026 01:10:40 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7aa8049sm11241175ad.68.2026.11.17.01.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:10:40 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Hildenbrand <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/khugepaged: mark a collapsed mTHP dirty
Date: Tue, 17 Nov 2026 19:40:18 +1030
Message-Id: <20261117091018.63639-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <dfbf361e-8125-4f8e-9567-65e80996e2d4@kernel.org>
References: <dfbf361e-8125-4f8e-9567-65e80996e2d4@kernel.org>
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

On Tue, 17 Nov 2026 09:13:09 +0100
"David Hildenbrand (Arm)" <david@kernel.org> wrote:

> I have a different patch on my queue here that fixes this as well I think. Please review.

Yep had a look and yours does fix it.

It's more than soft-dirty though. If the folio gets dropped while
another process still maps it that process reads zeroes, I had 64K of a
child's memory come back wrong. So might need a stable backport.

Dropping mine, yours obsoletes it.

Reviewed-by: Daniel Wade <danjwade95@gmail.com>
