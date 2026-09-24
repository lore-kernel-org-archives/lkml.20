Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0592441F7F2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239545; cv=none; b=EC3iEXLSyI2VRVSfSuSRcVPn+xUVRi3aCmKsn8zAfxsvw8WgsiFf031OQOW18WKeA4OkKUKCa4C/O5lLH/LHEhQZBR7iu2sVAOUTUsoboQfxnBZ5MEklyo8ngd6MWI/BUWTa8zpy6bp/A4MQTWmhKXvXDV2YK5Ecy8yKErG3hSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239545; c=relaxed/simple;
	bh=RjcNA6HmCmlxdxtVqsdef6UdVNw3BtkB7wp/J7/Uu94=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=shkXy7OxAOvoSwtS08GAUZ52Jpxe1z/Ihm0GgjTmbuKqmF+J+kiPe2p/TkAjaYEW0t2vqn225ziEm2kLqTzm4mNS1AyEgTdEmpglYVdRSJ1y8H6KqIKdC0+nFZZCwWt4SX2DnIuldMK1f6fOiVyi+dadcdB/9Omhgqo68Zxf4CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VcRCNvIV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VcRCNvIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790239541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RjcNA6HmCmlxdxtVqsdef6UdVNw3BtkB7wp/J7/Uu94=;
	b=VcRCNvIV7VTNnHp89qmuJ8syGfSBiDNJc77wrGz01fntnAjqBZbMUQ9yrwmgSidkDcdJhE
	0SAamUJsiox96SjY2jrhbGdZgNGQ2y6lz43frZ/gI08wWEN3x5o5UszxDyFGgGwI2Fwiee
	F4aQcyOon0h8g9H1myTQOf6a10h0mO0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-nSAQ5WQbPuKl9s_BJxc4WA-1; Thu,
 24 Sep 2026 04:45:36 -0400
X-MC-Unique: nSAQ5WQbPuKl9s_BJxc4WA-1
X-Mimecast-MFC-AGG-ID: nSAQ5WQbPuKl9s_BJxc4WA_1790239534
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA749187A5D5;
	Thu, 24 Sep 2026 08:45:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.32.54])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4C9D03000229;
	Thu, 24 Sep 2026 08:45:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260923133706.1496540-11-dhowells@redhat.com>
References: <20260923133706.1496540-11-dhowells@redhat.com> <20260923133706.1496540-1-dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: dhowells@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
    Jakub Kicinski <kuba@kernel.org>,
    "David S.
 Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
    linux-kernel@vger.kernel.org, Jeffrey Altman <jaltman@auristor.com>,
    stable@vger.kernel.org
Subject: Re: [PATCH net v11 10/17] rxrpc: Fix return in rxrpc_recvmsg_data() for service calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1551181.1790239528.1@warthog.procyon.org.uk>
Date: Thu, 24 Sep 2026 09:45:28 +0100
Message-ID: <1551182.1790239528@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Fixes: d001648ec7cf ("rxrpc: Don't expose skbs to in-kernel users [ver #2]")

