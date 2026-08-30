Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C073B27D4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788103989; cv=none; b=di7L8Ur/oowo0d91agEjDTsB3/+U6tRTfhI5Kjr/gTTx4f9e9w5S+cdEchCyXuPdllFmls2jIo36sB/z9e7WRf4IZQ0ACxH/Zd0MW2xOjP5hg+kde9u+NnHI3XSad2QM8n+FrT4jb0hhpyCc9epcMXEPR197OS4mgfPS8nTDD8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788103989; c=relaxed/simple;
	bh=Sg+9Tt42M7wTt4/LFTvHTjeZjrEBuLi/UxwRbyz8lpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hFGAxVg11cSpWDq9bZgFQratIbLzP5YtcRYxFGxs9y/2BO64th8SyGxEF5p8LaqGxBCiVqkW+FWd4Qb3qFuO2+vkAWU1F/ygZPAdXgkeoAiSlEsUk+hrUUmOeTaKGBeZxq8v3nCL94KQm+F4Z2J4lZKN8Dv5dZ/DBnr6unHjrSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LYt55VhE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LYt55VhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788103985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Aj3k9hjlwU4Kq7gYBMl2Em7CAKCtlPrgkUm62UAgOfM=;
	b=LYt55VhEjnQQCIs6vD3mpKOCRgmVahDD5odpysKUYE+up65m98J9eKS8PFv/aIDlEm6JvA
	mD9GVE/VGwDrdn4SL0URfx8IU0vSa+mvg5UF8B05UOqtrOt6PSzIJZApwqNV92Kkns/aEU
	EggiEeCy4mw4tNmU1XBvMg8aClPTjPk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-Ep9cKExHNWe0JKdUtlE-yQ-1; Sun,
 30 Aug 2026 11:33:01 -0400
X-MC-Unique: Ep9cKExHNWe0JKdUtlE-yQ-1
X-Mimecast-MFC-AGG-ID: Ep9cKExHNWe0JKdUtlE-yQ_1788103979
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A69D1955DD6;
	Sun, 30 Aug 2026 15:32:59 +0000 (UTC)
Received: from fedora (unknown [10.44.48.13])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 8D78A180034F;
	Sun, 30 Aug 2026 15:32:55 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 30 Aug 2026 17:32:58 +0200 (CEST)
Date: Sun, 30 Aug 2026 17:32:53 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] sysctl: minor CONFIG_SYSCTL cleanups
Message-ID: <apRNJWJD52wsaX3s@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Joel,

I tried to address your comments to V1
https://lore.kernel.org/all/anX-II_sAoJQy83X@redhat.com/

Changes:

	2/3 - new

	3/3 - don't remove the extra whitespace in drivers/parport/procfs.c

Oleg.
--

 drivers/parport/procfs.c |   8 +--
 fs/dcache.c              |   2 +-
 fs/file_table.c          |   2 +-
 kernel/sysctl.c          | 174 ++++++++++++++++++++++-------------------------
 4 files changed, 89 insertions(+), 97 deletions(-)

