Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF00327BFB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838900; cv=none; b=oDruHOgOBrNAYeQuyqaMwcidqxInTynTchITaiLMZtqG9p4uLA99+fo3EvVw8MWGapSSsPnU3YBeDvCgVblFYVYW6nYMLsm5li6VyFD/j7H8r9s5HW+n5ZY2CoBqyMlSkHaq+Qc+mZu8oN741kqe6LJvnjsHErvGRhCsxIqQ++8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838900; c=relaxed/simple;
	bh=RVYRuLJLoWEYUIPzk5QlE8xyUNB5ZMc142ZXcNtg7dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awKdA+tGCtAY3xm6Qc1nZdeQTk97yhKVDubOhnPAIV5o7etLW0twFiqdgSqXjdVvrqio3EWSMB1eWBd1SFhKciARQz82XqHUiXJUs1U8DbHz3/FeKMe/kDMzCAfXDFYs3Mx04BzzTcWL6TwMjyqG99b0k45pdkYxH/qIVaAVhEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwmKmpZp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwmKmpZp"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso3773795ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788838883; x=1789443683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVYRuLJLoWEYUIPzk5QlE8xyUNB5ZMc142ZXcNtg7dw=;
        b=CwmKmpZpidPWgTNUtHz9iVDSvoogM3OZQrY86EgrqKkljwNsoio7DFJ5BbPllzYr90
         QvY4Nf+OqiS28JJn9auBFqFpp5TZWxkghBBrd5bgu4/WTTLWNJ2ua/OMMGnVB6b87fhr
         hx7ky/Aw2Y7GpqJAz3yySKwE7odAnnm6BOWDe2gNL4G1k+9mwfZSLd5ZbUEjXiwuW4rq
         fCGpkvPTD6tW7Gy3NvcUklW86CGQlA6drmpSTURUHbKN5sIxTKS+8f3yCBHJY95cn3mc
         y8RuDC+Xpi184wU5YC0qs0ykYSr5a1KNR3pSOwCP6ilrOGR2Nxn7v7N5sz1yZf32fZ+c
         WoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788838883; x=1789443683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVYRuLJLoWEYUIPzk5QlE8xyUNB5ZMc142ZXcNtg7dw=;
        b=iw3wPc93d9/Fh1ZFivDhm40H9adhOtGJxLMMYRio9GkpElk1BksA3kQ94PVc4DFHvH
         c6NMXaOvGpwNAplq3K9PP1ib8MpVaf1DSDjdaHfpWR8/cWvj8uYExCWsoLrwn03aVh1g
         22OLEe3Mf2DHC67ojAxiJ9X6efuVBMy3E/4cXNKSSNBoAr9f1jXM4DItU8PIMQK0ngRf
         EatGINi9ypJhRRVBoU0ieSJxKgAd1nivcn/a8LlIYzzpiUKjGg+DjJAZCYXR85OzzfGm
         A6Lw09vRm3aRk+EYcPzbjnXMZOsAJUnAyCcq8cpfZ/6llwtDxeHekfw7HAm3cRiZux6N
         DQAg==
X-Forwarded-Encrypted: i=1; AKwUvBxrX3QQlGdqsihxNiwUl5JtfSQBBsvRxaYjt7WalPeGcXGEjxsNuVxQaMSof4sQyDo25IzWgZuORWU0rbU=@vger.kernel.org
X-Gm-Message-State: AFuF++lgzbCNlZTd+qmuRX0C1EpAgZ+IdVrcAqZ1+BiUact+WPoihzLl
	rQKHTYfWA11AKKJkYcedkPLWkdADgqKZu224hMZpFrp7WzgOUcjAuD2wPH50ASUs
X-Gm-Gg: AYBFou2yD9XTbLKE9UXfV14OJYdd2ZedCbrCLQE8s2Jk7xY1/F8tMpAD37buONEUEZA
	c/4cBnwvsP1nwpiT0AK2BjH5E5+OvDuDj/ZS5niGMag/RCTGBpNluiK6TQ3yce0E4oVqYvj3dkX
	JPVtcqDlgwsQk1lXvK+tn4jKQrUqO3ak0UT58HChZN9zA7951oNeCrzp+NOzCv/3nqqpEgspvHF
	rU5Ly8yvxu4e8dvLzLCmHA/ngXd+cby1UM9LqrtxMSg5ECopnGR1UFVAoSZ+kZA7dty6xfoF0ae
	d6b/uLO74xioKQwnI0ljPCu452lhoM9V8kstbwYWHhx17VPgFEG9pcjewqixSkSw3q/1DIAGoLW
	nsUgumZBCmWrQF/SvGJr3V2l2BpIXJF9AIPdPw6amJ+LIfTs3pjgMeY8YeDhwFWkzCiAJq1YUtp
	ZAcfJOu8Wa6MDCGF/wxV4s/aYq8g/hwMHb26n/uLWM3G5MB72nYJ//qBGBVDM1RI0ydVPBlxJUq
	YnFas39ryQFPaUA+B37J8+0UpLE18DNIT6MNPvI
X-Received: by 2002:a17:90b:2801:b0:38f:aa76:88b with SMTP id 98e67ed59e1d1-39b3d7d056fmr17645951a91.4.1788838883266;
        Mon, 07 Sep 2026 20:41:23 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm13696442eec.5.2026.09.07.20.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 20:41:22 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless v2 1/3] wifi: iwlwifi: pcie: don't infer CSME presence from a failed read
Date: Tue,  8 Sep 2026 09:11:16 +0530
Message-ID: <20260908034116.416258-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <60a8acf1adc0d2acc5c558c4cc791d01421f6b92.camel@sipsolutions.net>
References: <20260831130332.323549-1-navonjohnlukose@gmail.com> <20260831130332.323549-2-navonjohnlukose@gmail.com> <20260901154828.GA1879052@bhelgaas> <20260901161736.GA1883420@bhelgaas> <1a2c11d47b27dfd8a246300ac158d25cef5abf35.camel@sipsolutions.net> <20260906230022.148733-1-navonjohnlukose@gmail.com> <60a8acf1adc0d2acc5c558c4cc791d01421f6b92.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fair enough, and sorry. I should have said this up front.

English is not my first language, and I used an LLM to look up commit
hashes and to rewrite parts of these mails. I see how that looks on a
list, and that you want to disengage here.

The work is mine. I hit the D3cold failure on my own machine, did the ACPI
and Ghidra digging to find why the reset never gets armed, wrote the
patches and tested them here. I assume I should have written the mails in
my own words here, sorry if I violated any policies.

If any of the technical points in that reply were actually wrong, I would
still like to know, since I would rather fix the patches than defend them.
But I understand if you would rather leave it.

Sorry for wasting your time.

Navon
