Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910649;
	b=FBtdU2sIedSFS2MBK5kl4A+yf/a5dFSvZ8uU1wMFLBzYBUUgJjZotVkHciPsab0dHyjq
	 eSS8wqw+jAvaGKlt+ou2tRURz68X8ME2U8KuV0aVsajJYInXzGoDK2SwgWyiC1JUS6tDl
	 D6yqZCCxYYzsOWn0VuKOhWjKdjMEAEK9hnOuglRu4PlNEssIGscVVrZ1PJxNIPWzG2SfX
	 UeYFLCMDMMvstIL3nJGBTnlRhwlm8NmwqN/OctESuaaPne2QfaM6bK6r8Qse2+LiTBRKY
	 5IMVYlImGRe+eicO5WTOJNJjLN3QaQZGTgXcCnkhGZMjEiNZ4FN+lu7LK1fMpxL3Hnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Mi1vb9N8Y+TjLnAkkCLxRTFnlP/8A+F5gvm34F3Sg+w=;
	b=nP3fyzgvIZ6LIsH8wn4SLMqmGuetl8DF5RTDYhW8W9ScwmQncAg9ldMEw2D4tkd3sw5U
	 /DbQOTuyIK4OnLr0TOQ6UmB0b24iXWUnNUbq98N0+Rl0/YQLhfdmu0G4k08ximsdaBEle
	 tInOhx5FR4irEQXNeU1eIIQEAiU1dBNrobPXS4YWLMdxnepHgZpW8dPw4eFxYY0KXJXvb
	 zHQhMU1N0mOWK8pfsRPTeOGC+Ye2xVdnUaWyHcgAoor13PHF1mZ0A/T/kWHZ3HzlflUv2
	 16errs5ucd3IloY9CG9AJ8n7ioiblQ7dsf/J/5wghNOTV8D8GCHvaAygQGo6eANS+Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Blfe0VBV;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C7606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1C7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Blfe0VBV
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2722186b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794910649; x=1795515449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mi1vb9N8Y+TjLnAkkCLxRTFnlP/8A+F5gvm34F3Sg+w=;
        b=Blfe0VBVk6XBuD1CjCd8cykxB7IYlSXGN/tmUAJYufKAqDnzUrNoywd1F+2riuNmZQ
         Os2377INfGlHk+allTN0lieFZZo6MMAFklF7TVMPjIITHv185YAskZqwwp5a9RXLZdfY
         s+GSZuJP7R5/FopLc8ZZECScPrXjRkjOuSWuJawtGdkDqyFPO09aSfSFC3H3Dppu0Xag
         oh+sLaxyHd5VTNokBniyAly41+RccoY/f9WiWrR23dpPNu6NypWf1kl60AOG10beQhUG
         EXfq8bcb0sm6FHCwIxyG+vt5JveZhk3P8VytrFZcXz9Jm8/AuwNTdK/K6mxuncN6Eb1j
         csaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910649; x=1795515449;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mi1vb9N8Y+TjLnAkkCLxRTFnlP/8A+F5gvm34F3Sg+w=;
        b=UNpwsQrj1CuuQRiWq3eRjkAmmYDgZxFQEookFnVkjYQWUyTUOaIKAnx4sUOyISfKOz
         JAC/5nFiq9g/lHJ9ZV4Zu4IIfoCbLOgSBmFkfzMlraMyMY1sUo9s2h1U70SdggtJNzZJ
         assRfMk1LIxPL+rDKZzL2FYFAFOSzehRepGZS15RgvAWYOugACZLqetb9PbqQ6UWLVAW
         CrtK3YY4al0VS1daJ6/Eokl+1xjQwUxiBiCw4MieFYjhhBH7KAXsvZgnMoG/cJDZ4DHq
         Cu+z03P0S9WIqHYV7OQze9OSwWGW1EZSet2r2cK2BWy3HvDvImlmq5k3DzVkIxt8PPir
         Ycsw==
X-Forwarded-Encrypted: i=1; AL+hErGdjNA7HnEWFfKbwvxcGbEjuVgap43F4QBHNBrW8BKNFdq8NmRtgV7cJfRfpQQwVO8wP04KAhLl1Fe7Lrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7dtNK8ckIZLW/5CbvE671RUgRPpCS19aJSSIAal50h0YRHlul
	gp6LB7+jqR5mDF+6vl4FvW3SDqY25UQmtoat5koBJ/+W4gZE0M943hX8qDSfHR0L3DU=
X-Gm-Gg: AZFdTZebbxaoYrTuJX71HGKEjK3NWohabP6FLQsmNnq/XLcrDPItkDCCZpPqdknRAbo
	Kn2tVpPa0L8cbZfsWtNcisS9htjUxRdMcSWUI7qoEm89dzBjTY2mHUB0HnAZTlrAXKiSOwMTpji
	CfRQUE5GKOqkcNdoRIlpZ7yBKY256LfpIjoqhP/66WliynHq0o7vd8sfu1oJN1N4JPlwjqN8kuj
	+mBEiSTOUthrAVeYnVuQ7hnWnihcc8Ca8NZJxgYTwiGmZAZnDa68nr3HcjM6QZCN6Ahhb8l4Goa
	o1nLDQMPwwGuMn0GvPujNqN4kisrTiY9LVP80HLrMENvd9ZhJbi4cVIGfcgYXVJWqqC2O4YLnbA
	NQ5IX5hDRPbKCtyTFI2fvOGefGaTl+++19ajTmjUdZKAeflOzrG4O5LYMFNJx1s8IYx/6mCKmlT
	3fqhQRKK5pen03OLFPDRusClG9WdhozvXiw5IqLlwi+MfDPeSwJ46ppVmphsBt7y2bw8ONiP7D5
	T9nOUGXOuI0XUUHMlu5Ko5Bplzr+S7g6sMkrCS+lmEqwCYkXRT1ro6dMkurr73V49jvOcyW5D/w
	MMLzInkHcPranAA3PK++6Iz0J9z9wpRShwXYuZSfV9NCfmwfYRrykWK3vqkNags4jbzXzfkpOIu
	4L7SHj5sWiqf7wHdacoY+GdGDE3+h/ri2XQ78ag==
X-Received: by 2002:a17:903:1b0b:b0:2e9:9f14:c44 with SMTP id d9443c01a7336-2ee0e0bc9b2mr139528585ad.49.1794910648848;
        Tue, 17 Nov 2026 02:17:28 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:cd44:de10:449c:756c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8668sm12633385ad.6.2026.11.17.02.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:17:28 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: lduncan@suse.com,
	cleech@redhat.com,
	michael.christie@oracle.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] scsi: libiscsi: tighten task completion
Date: Tue, 17 Nov 2026 19:17:20 +0900
Message-ID: <20261117101720.1894905-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115122122.1446791-1-yhlee@isslab.korea.ac.kr>
References: <20261115122122.1446791-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v4:
  https://lore.kernel.org/all/20261117101500.1894608-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
