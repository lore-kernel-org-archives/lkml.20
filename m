Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553443;
	b=Spgk4zAan1OIgjBBRPfRpLST9UTJDeF86dTJ2EG3z3ZAmCAc3Yygm4/ceFLhqKnsxmLn
	 aU8P2R1mLcGhqRQIpLzTCqiUDU2uwDBSkxRWlweJcwYu7zFKrZ4O3cpyRLxnlDbJN/bFs
	 y4GJJI2UQHce7zuR9+4J+p4TMzmlDiPC8uI58a96hlQjl5Z/A1FEjD02GSbbn0Xu/5JQT
	 nyIvsVAG7LITjJ1Pd/BRRbRKmVPY1d0Gp2qud9gdbAYkStm/GVznoMfr292bjJxJdVH2l
	 b9JBcgOMuBMIqelJ/R4Pg+Yu+5ZwqgccVCcHaF4Y2E6RlMyKqVkh8HVjr0K7VcDtjuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yJI/AwvWw9ZtcVwYBN7RmHmHmpfI8JmDi9ntIdzMotk=;
	b=Ra/APkRXfRuuKvXgsW6TVoeanS/nRlTitzk6HGE4TkQVN1OFBFOzMvsxBokmXHxzbvLY
	 c+nyVT7mokn/tXnBIFHcnwv87azsPzxfsmTh5Wxd8o6vzO+7hbxXXE+oCllVkmhd7TiQ/
	 JXmmd11C5Vkj+/OjVR+olPJz9BV+263MHhCOusI/xo+JpQ2c0CCxK790LcKbTbuQ7H3Ai
	 7hDw2ZlG5W5uLNvncZmnQIqcOslGiBGxtUyevpyN/fl/38c66sUyhUgl+BBKScG0LxK/L
	 sRt60nF/SS4Y+7Ru3XggyFWQ6CRQqQ7QaFriy8zGWCf4O03bhQptBxGL4zwDsnI11Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQgkAmWW;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4C0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQgkAmWW
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3791619605cso1426255eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794553442; x=1795158242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJI/AwvWw9ZtcVwYBN7RmHmHmpfI8JmDi9ntIdzMotk=;
        b=FQgkAmWW4/I0W4K20CURutWBmGJObO1eojobdvW1efUvVPMdcVdAAW4wrWVb1VSPRc
         Xb18tS1oPeyJILsOogzZd1xWKkODzM1onNrq6oMlpDYNffgwhAyPOJ/TpFVTXSOzSwf5
         hzN2sQXNW2e8zqmgE1FMUMxPnTcXIkqlu3H0X1aOimK5Od7A11b0SoyD2fK3BGcFT1OE
         Uo4sDqn+YSIAihI84sFCgf5Wz5hiw557M/NrtnYf+VS50UMzR2NcG6AQLzNsP5C5us7H
         BvT1WtWfZM01uGrhc4w9vpamf7w7LfJvPabaYZ/2VQeQzjl7xI+UfzyWCt1mnbBGbuKm
         eFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553442; x=1795158242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJI/AwvWw9ZtcVwYBN7RmHmHmpfI8JmDi9ntIdzMotk=;
        b=sEXP75UzwqUk9oRm4yCKgIZ4P1PmVJ2jH8tUNPOyB7JNUINkqQqb4JNWac8RZCpa/f
         1R00Wtt7cno46tfOWluwAmTS8kHtRSlf7e7X7FFSNNiyVhluhlQKftByuU0SoaAYh42K
         REuMFPtwIeBNDuThpp4DlSNNWFiwlXwsGVqGWCXkW7z8VdBNS7OtL3enmdRPHekWyz/g
         RrC5YIwqKxyuKPe2s6uEfNstrX2eEu6wVO7WgBcvKWhqMwN/RbvXXHRxAONLYJHeEQ2q
         ufUUMJ2GxZjyM9/amRkTnRwxq6ztohR+xwOcxk7U9JxGB7VmBT/paRp/ee/KHIpYEGV2
         G34g==
X-Gm-Message-State: APuU4Z9eRVMy+58QPHO1MXXxeVuvDQ8J3sBRc1drmQjNbarAdmxViA3E
	Ccv7AY81MypQQ4gXKV3ceTvdYQz1xJLQUEMFjcCS7ZFTXLAeraY6/Ofq
X-Gm-Gg: AYBFou132BpUkSfyddLjIDS+lBkL0FpmY8/xz/1E1f8favOxzOnTlFtI6L50OmqjFCp
	nsj4KvZolReHviMkiy36JG/Uu++I+lV0RO0o+p71/0as+sd8xL1AA/sk0sGlnA5uG+Z+UUJw3fV
	ZJ587FAcPOFYagh2jEbga3OiH94ooaKh+oTZbUd+7S/fgbA2+EG9G48VXrjZYm2mdGIv9kEPdEN
	q/9BcJByDrgp94TSD1+zJymSGsPvzOE+1MGCTbrnHzsGZmuxJsrJt0kASkUOBiwG0gheDXzXR3g
	o7UZURtAMl1aNfM5xOP3cOX5q8vt0N2g1GAOeCv00V+aBOzL0blQjcbO/wJuAqcHvHVtC46C12f
	z+hE/ABe9ctVq1he3vabIyr4C+at1Dw5ZKHvsLlrqaJizIqR18x2TAtEF5BdfXFWHk8iSN4MXYI
	2zxJMwB92Nnh/i+iOCS3e584WPwZrHz7xHtRu7X3k5DHsX05c+lQMzMD0UJJueG7DcXE5mNJDkk
	dEpzGWeefTT8FM5ugyVZ1hU0sAzu8nsWjYvGU89V9ER9x+1DkX+WvjbbCH4py5X/QNW/iAFqREa
	y5Je8ZMAO7RKZHkZhdoO1XPtrQjD1Dw1f6GNnilkYqZkHdML7LQ9
X-Received: by 2002:a05:7300:d80c:b0:376:682d:bf1c with SMTP id 5a478bee46e88-379679e4a36mr1513614eec.41.1794553441845;
        Thu, 12 Nov 2026 23:04:01 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm4487778eec.17.2026.11.12.23.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:04:01 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Gentle Reminder: Pending Patch Review
Date: Fri, 13 Nov 2026 07:03:39 +0000
Message-ID: <20261113070339.2750-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi Takashi,

I noticed that my other patch has been received, but this patch is still pending review.

Patch: https://lore.kernel.org/lkml/20261109092249.3559-1-sreekuttan2156239@gmail.com/

Could you please take a look when you get a chance?

Thank you!

Best regards,
Sreeraj
