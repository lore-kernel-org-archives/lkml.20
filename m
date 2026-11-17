Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916254;
	b=mlD8KhZjEgvmfp0MA+SJV+90JTfmk+KQb/FFbfpafgPwk1pJzcT9pEh1/SQcKHKRTxXv
	 YJgu88KzLkA+sp/4tL/1/VOfW5sXkTA/2vFSGmnzjpVWnuPPDUFaT4EUC0DtFwoXJQppq
	 dntIw2VVuQ7tlORFqLhV1/NxHh3ONlrUue09r2Sv+139xKLQTeXU6Tr+McjOecY/92z+Y
	 HJBOy1diAFYVoFzg0PGvsYS3p0XIu0vDY6Kieh1qdNHjZGg0bbzEGZecqirrEG6BcRBIh
	 55rthQjR0I2ml+Aylxjyh7aH/pxpqOEI2t9seSfBOfCmAHdbUjuV6Hw9kWCrARKFD4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vox9UTwbHA3vT707I3aI3S7jFRVVZiEckXrdeJNrXd0=;
	b=LUVGTlI0I1SpuMDwuaGGu4nNH+HKJPWojOcyqUpgCo//Zsub9M5J+iofbDc/Oq76OLeX
	 e7YNw1wUldFDvwQSRGexOWvSkGL6FjRRD3oPQ9ipJ8u/8vNfcUAIhzmUGdRp9qhGKef7t
	 InxgRQq8TUvNDHXF3T8DaoEY5kzG8iJxQrJN0eMlYcagL7Rr/Cq5ZxX+4kVE6T0eySG7y
	 NETqdY/ezbu4wBDMmHl9Bwb/rU6kPMdk4iPnU+TTcBUcoLwArVbjH18U+x8bRdZZ9HBGV
	 +iXDTWXMhtNCI8VM7B7UHk2/XkQhuyF4uTXp0b8CiYFoXE3L+SG3LqG0MZmHVH2ofwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=T8sAbKSm;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27326606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27326606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=T8sAbKSm
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so4175853a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794916253; x=1795521053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vox9UTwbHA3vT707I3aI3S7jFRVVZiEckXrdeJNrXd0=;
        b=T8sAbKSmnqw0foDwoe4J88XYmKh/nE0/+nZQKU39t/Rq3a9Kzm5WmmULo+Wtw5SnwO
         rNAiT05lr8OFMBtVKlkDoozNpq5TVnWVk42lx8hlW9j62ntNvPmwVMDuqwxYMb0FU43h
         GhEqQ9G0dkZvRn4aZTtFaVkSqav5z67WRcKkKQJYQSj8t4WpMGNlRAOuLg9e3oOs7hKM
         NSVtAE9dhQ6mDwQ6lY/kaZfUlLPGHWeiJb3cy+45BUjs+/KfOw+Aw6DD13bLPpyMnTuj
         QGJyBUd+QzoUD1phhN68QsZNRSwusVTL9n0up9cP5fLwZd7RAUeAmrTs1y6TbNjK7Htw
         O63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916253; x=1795521053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vox9UTwbHA3vT707I3aI3S7jFRVVZiEckXrdeJNrXd0=;
        b=zlbb8sJ18LJytqMJOHtTlLL44BvC5X+2QhoH5SbcNQIEpRbfIMGxmW08QVhBTLlUOK
         maERj3pN6e6F4W1CaRujSzkjxs4a3XKkNO6sJyQk4YLfJLo3gpLk+lXD0RXNfwDnDXoJ
         TMJDhbZtBALvWE4SBqxhTV6uJVdJEQDH1r2TPoQ/yJRaZv2aLxj/jZzJGISUjm3uWtiN
         nqqASQpqB5bXXGfXnkkQ3eu8VvpwSYM+UePCKImu2rnUKFLKGE6YTpf9yxXp/dSG1TkI
         9DYmJt+bq5BFlWKQAUKGxtdU6iHJntGbDC9gx98XWeKzqacWjqrP5Xy7oeleGC6rRD2i
         068g==
X-Forwarded-Encrypted: i=1; AL+hErEJykS10nmFnOBtmb5h2gboG7Y3jgyjhHEe4CL/BRY/alOQ53cIEhJLz466hEyLq+DIEm2fvv0+XfVgoYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qD0e0k0FmRj9ChfbRierkMs1k1pAnle6IK90XyaWGvpip4q8G
	HLWRjSmfPV3PACmSvV+zk8cKvnBzP+I2qdkNJ3xDc8eVNNH0UxYy8D9ZKQUvSpwO0JU=
X-Gm-Gg: AZFdTZdRrVwALOKNF4kYE1BJiCGQAiws/PSdmXFRXr57ZtFCsDLNHe5MpD3l7mV5/SC
	VibaVZn/SN4ZXbn2IUOBt2dgmWeH04q1uuRsKErO4odR2M/H19uRzbNJe86CEStDxC1402DC+KS
	d62iTS96GztiADqo75KJUIa93otde3NCItWAlUhx4T7rbJT7XaFbNW7kvSDGFVDGlAAbc8yGpjk
	QmPLBFR0+w3X22dPMBF7OfwiEjowzx4yd6rxD+thJHDHwPno3puC4oxxHIC/myrhozjhC9Vaud6
	POUwdhXBvy/WDLEL3MLHjDcQn0zgCQZyb0Vl1mHYjIzRs5gGf0VmTFihImG1Ni2uf6+pEV6fBqu
	xGZlHkszhScv1ctwQUt/+iD3aZTgdO9O+Fu5x9g8s38kWdT6FxeYgj/94Lzf8wS7qi47tVwqdh7
	1WBwzLU/DC5Z/RwkXaxqu0AoaMYsEMDDbG/WEekWTk8Q7jzAL6XxfiCauuMRHKat2VImuDea9HM
	uObN4s/KTXVdVduIwj7CZwErwtXNqRPg9Mr6WYNKFEsXNlxja/SDXA20rYxbyTT6VgGtWuPkiA9
	Y36QU3H096K4D83Qy1jwPBdNEXxMtO4vGcFQbYBWxl2mFwig4BhhvyR1sEBA3TYFa5+q1AYCezp
	CG1kZ1ZaPB6zc+vkYMI3/0zOxyY+zd1NHXq2c3g==
X-Received: by 2002:a17:90a:c88b:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3b1b09e6a07mr13635182a91.21.1794916253425;
        Tue, 17 Nov 2026 03:50:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:73df:c7da:8e76:82c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm4173884a91.13.2026.11.17.03.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:50:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: michael.christie@oracle.com,
	bvanassche@acm.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: target: iscsi: run the Time2Retain handler in process context
Date: Tue, 17 Nov 2026 20:50:46 +0900
Message-ID: <20261117115046.1955877-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115121943.1446744-1-yhlee@isslab.korea.ac.kr>
References: <20261115121943.1446744-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v2:
  https://lore.kernel.org/all/20261117114920.1955697-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
