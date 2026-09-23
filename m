Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4483803D1;
	Wed, 23 Sep 2026 02:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130699; cv=none; b=sqQP57z5i+YQS2xP+eg/XVFBWVrAjQdlmORltHAQ8DqUDRQNzRK2qJymPR+VLmuFl9zkez3aLfotJBPLRV9EyhZe6O3XjSusNQyFhEDeXK7ROjXuLrjj7SGK2A92OM1wpg1Kw1odActYm/qoadQbaptNWe/ua27EF0X3ytHiOmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130699; c=relaxed/simple;
	bh=EQQEOXtwWQu7ZO2YFOqf3SDcgDd/5RQkuGxg1GIYdWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DC400rvwMrDOVfOcUJin1oS8lkPtVxDhbGNbR2T09M5GEMifKAS86T7dlcLstUkpUbC+90HlfO9UaOZrW0dusf1hxIN6Ti6vQ4wixVujAuSfQibi+eeZcjug+94rqIqdJUAmjgC6U6wpTfKC6gUInKfLhK2GbM4Q87nRl0/7lGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G0Zz+CVQ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G0Zz+CVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=E1
	BjnqYpjwmja07iXCEPtn9ejJYfXOgfMkya7BEEYuk=; b=G0Zz+CVQrGAS8qp0T0
	GJxnlSxeHeX28d2JGDE4SQvnFDNSqbRP09sUgsuL9n3rQCVIA0+OmXe2xtgl862M
	MLqWqIVdKNDmZ4M2JMXw5xSGFsc7sR3STVpgGHu+/bu/uwXuiQW0rAhQNG3Nz/7H
	4Yy841//W8R1YoNX7torVfrGY=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnD9jWObNqbG79AA--.45419S2;
	Wed, 23 Sep 2026 10:30:47 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: Re: [PATCH v2] dt-bindings: arm: vexpress: drop the obsolete hwmon and regulator text files
Date: Wed, 23 Sep 2026 10:30:36 +0800
Message-ID: <20260923023036.352192-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922091636.A5A401F000FF@smtp.kernel.org>
References: <20260922091636.A5A401F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnD9jWObNqbG79AA--.45419S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWrXF1kCr4xuw15ZryxXwb_yoW3urcEkF
	93Ar18G3y5tFsYgFyYkFnakr97G3WSyF93XrsFqr4Skr92kFsxGr93G3sxuryIga1Uur1D
	WFZ5Ww40v34jgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjsNVDUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC4xcLgGqzOddpagAA3L

Yes, that is right, and it is what 1/2 of this series does.

Documentation/hwmon/vexpress.rst carries that reference because nothing had
pointed it at the schema yet. Patch 1/2 replaces it with
Documentation/devicetree/bindings/arm/vexpress-config.yaml:

  https://lore.kernel.org/all/20260917115818.540344-1-quchaosheng000406@163.com/

Guenter applied 1/2 to the hwmon tree on 09-18, so the link does not dangle
once both are in. 1/2 has to land before 2/2, otherwise there is a window
where the reference points at a deleted file. That is the only ordering
constraint between the two.

I ran the grep I should have run before posting, and it confirms there is
nothing else: the reference in hwmon/vexpress.rst was the only one left in
the tree besides the two files themselves.

Quchaosheng

