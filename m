Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9541F7EA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759438; cv=none; b=mEakZGq+1dSLbBmIZGsP9U5G3NecsbhEN5U216lNYsEEVB+nTkieHwJzlPcuH4UB2YaOQe/64EjtDeorwShoigUE9zqelG/ViElNet3fiVLl+N/PDpuo+dGMIo3XcOAzM23lMyaxDrzyvuXYsiLjF7aw34wAxFFBzAwJDxb70pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759438; c=relaxed/simple;
	bh=y1dRcM1u4ia4jyoRkwNbhGlt1395IprSJeY5SdwYuVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSy7bW3W2R8Psx4N+gHCZPwWjE9XyQAg6IHRg1NoRtnlteCd+f2QHlnPY1SMsq5XBeyOy+ZtVn0ABcM8ivIwKBWJupHDzA98/j2EMC2T2lN4xaNlQBu18z9lHSJ8yvn6/nLpv3Xulp944uQCpdaL2BHtl9mlQraUiGb28j+/dQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYCjaNhT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYCjaNhT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so21118015e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759435; x=1791364235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y1dRcM1u4ia4jyoRkwNbhGlt1395IprSJeY5SdwYuVk=;
        b=LYCjaNhTjr66jzChECMrEj14LAClcHPcCdzFt3TUrlG3xPQlBE6crZ6eLxOedlSF8u
         Vi18ZwnUpyQJz87aAnJyhwgEmABPUtkJb7/K4gPRhf3PO/X8QNnQbj15LYlBWQLQnW/O
         OoZzUsEvC3XHMxGjSq54ejukSoHxZkpCthJ5t5ClhDXa+8UVubMzJzOdOrDuxNiQBtQd
         O42Hvem2Kp01bh/zCJmMehywrGjv2BJMW04b2AV4Pq6PH+hgS+iiLyyDtXUYtXP1w+6u
         ECMiW2vknnTn/2B+Ez3Vd/v1BMBMUX+DQ2vsrTVhWUtA9VPhJCouaiC0gD+XVy81ggYw
         HznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759435; x=1791364235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1dRcM1u4ia4jyoRkwNbhGlt1395IprSJeY5SdwYuVk=;
        b=j6IQFQd9HVWbZ++Nyi+X0MNDuYM5s7EZFAOZsi3DGm5bhPURSwXtpkeSkC1Iv7rB9D
         cRlV/AVYuExToWvt11A/5bZ/XZ98VP4mk6JgFrP5rhM5m8UCJb2xUJxIJ0VGWMcst/Xx
         iGkdd3kr6UQOfle0CuOKoSOo+RRdJUspqDp9M2qg31hwaofDWw3ucf0ozL9sjmZuxE8S
         NjkRoi/Na/6NWLUHN7fbzWE9X3konn2flarijZkcdfBdhHXJX0WGZI7mYCYr0ioirF5p
         NMCI2s4ZKzvQ/LpAMMZzCFK+pw1BnTs2bTn2ZsO1ppJzxRRIHai0bh7oMTIzyY6g4Qlb
         wvSQ==
X-Gm-Message-State: AFuF++l/n/FDZKq1zEbV+Qxq+uaMhoF4sAF+xnduYy6NdpbZanFVoRSn
	ECLnPFGHAhHk0OuFUWgVNLBklWRr3gMJfZElEyI85smxoJMYSpueuvAXFgJen+/feyY=
X-Gm-Gg: AYBFou243xC0vLfwb0yx51TYho4Dyu0WqmDSDd0wR3LoV0PwOsAJaSJTXbzl0knO8ZK
	bi/n97XSPJU7OqPqFupPlGsaWcxAVA/pCtQK8px1ICWit6m0W91udewZAk4Y5jcED8y+mfJ3gJu
	USaF1a6ykPQha6X18tVsXYSXr4xNTpbz6Fe5gTLf4xdvj+PFsHGLtxEVL48F0BAA4zzsWcGq7fT
	3m4pSUYmLvSdlDwayLCzaagJXCNfDudeWpt6VKk24hED597WaAdVN6pRviljW5CcIwdO+7FfSt/
	pRMDhCNKM2MsVC2qpNAOP1j1/SAJMVxmFkSTojDFHrp25BrySfGVeCBim40z3qGx9iQ1KftgLji
	XZcbQBi9pcHRe9ouQQrXhw6wTDe5VUdPNaJERi+aM0D6+BY9Z8gcuRlCzV5eUhKtHJL0D28luA8
	dzON7xqDOiv2ctp3XJ0aDGxHWV4CY1kXGPuPYc8azBy36gBDCIQ/TAx2TH6A6dYZQQt2WKN5U70
	H9v/kJxdLCpcHJNXSSA
X-Received: by 2002:a05:600c:840d:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a01b128472mr12394495e9.32.1790759434607;
        Wed, 30 Sep 2026 02:10:34 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a0175161c2sm45458125e9.4.2026.09.30.02.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:10:33 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jie Zhan <zhanjie9@hisilicon.com>,
	Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v3 0/2] sched/cpufreq: fix schedutil's boost frequency handling
Date: Wed, 30 Sep 2026 11:10:24 +0200
Message-ID: <179069242536.2121.14601372514436460845@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a Lenovo Yoga Slim 7x Gen 11 (Glymur): boost off 4032000,
boost on 4723200, back to 4032000 when boost is disabled again.

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11
