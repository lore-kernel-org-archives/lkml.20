Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF8554086
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905627; cv=none; b=COnmx/k1RCKVXjs9B7NdHuFl8VVdynIb1TQZLhIODeUFcwVFjiGWzzEJT58BgBmbHtadkl3YQ0owi0Rsh+k8akoZu+tyYLjAUKAdaH+tFkgVVIgEaixNs+asn5aO5i52y/eWeSFDoezTtbZI84s9v23j8xL3dfZ5sK6akujh/RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905627; c=relaxed/simple;
	bh=u3Mn6xLnHu8em3WFtyZnSUaeibjcFUHYkzfz3p3MghI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgSLAnTvXnjDvlzx2faM25noZ/hXz5WAT2zDEVDx95Dc4V867X7Q9x53g6bf1wXfeURRit0xIwquPhawVWDtpXnsTXV6tWDGX53SJk6xqtw/LXFy5IsiL4u6OzvasoKHt3KErpSmrKiPspRlFz9EkfvQAVny1xroYPHy7TO4xZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjPVyDoQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjPVyDoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513131F00898;
	Tue, 13 Oct 2026 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905626;
	bh=u3Mn6xLnHu8em3WFtyZnSUaeibjcFUHYkzfz3p3MghI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RjPVyDoQrUuXp45G6Yc40x975pWRT7PbYcpk0R79ZrxWLBGIsue+tSV222VGc67jA
	 BRFIUlgnL+1+cSdOMcRhbr//bwJK3eYfPO6JV+GpEUaesjMrj3t9KkEo+IZIE/pfwg
	 V+JRkbGTRh2MBh265MRHE4C2Z/zi8yyza/3wOSgL3nX1XnUXs9B68y+7y1G8PdHpgR
	 45G3HpCRx8sMUgYEgHjxD3GqowGfQHEJ/gdrbSuHWpvfb1eSWKbzW2M2/dKQYqUDos
	 ma3eLKwCFoBVkgVP0a5vNfxKeBFLneQYFGUR2/fN31QL++ZfF+4Dzpw5mOB9ClFC/Z
	 dAr2z4HFZApKQ==
Date: Tue, 13 Oct 2026 09:33:44 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Chris Leech <cleech@redhat.com>, linux-kernel@vger.kernel.org,
	Mohamed Khalfella <mkhalfella@purestorage.com>
Subject: Re: [PATCH v2] nvmet: Add traffic based keep alive support to
 configfs
Message-ID: <as5PWLBhghebm1Gn@kbusch-mbp>
References: <20260923202003.1776271-1-jtaubepe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923202003.1776271-1-jtaubepe@redhat.com>

On Wed, Sep 23, 2026 at 04:20:03PM -0400, Jesse Taube wrote:
> Add the ability to turn on and off tbkas (traffic based keep alive
> support) via configfs. This is useful for testing and debugging.

Thanks, applied to nvme-7.4.
