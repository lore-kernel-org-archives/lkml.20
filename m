Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0653411F83;
	Wed, 16 Sep 2026 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542811; cv=none; b=IvvsLgdj5JiZ/qSZxT4YrZqGyU3cPlTpArfXF/y6qhAbLQsY/2sWw8umoMor54OQl55u9ymj8jWwnJO0ca/9UpgyxpAlaTtOClTe2GC26AOQwTMsORHhhnGOZz/GM98n0ulg6UrzfH6tsDwN/+94Cm4qYgtWbkDnlxNTqJF8Ilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542811; c=relaxed/simple;
	bh=NGUu7Eat2u8NKBdJT5OjJPLD4oT04Rr5HsjYrsGJzW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5EypVXIMabbyu9uqVJfrENQ6ENaD1uV4Lf6yPhSFgQCVHtJec3Wr/74CzK+B32LyY8NxPvB3yOAUOBCPkT/Zia06driZGbjG8WUDB/wvWi5i69QTvjCwr2EKokwqMA0SSdFss7xQ64fCWCz193g8PXDLG14nz3NeSaj95kxGeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EYmQ4H0n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EYmQ4H0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CD11F000FF;
	Wed, 16 Sep 2026 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789542796;
	bh=ZSwnXaMIy041+a4ctb+SDaVtRs2WLnKtUxx+YycEzsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EYmQ4H0nu5BZqOUtqtFo2NYp9AVPzFGDUe5ZwCzKuB6TK2x6pfyMvPLUQ1VNB92nJ
	 RBjVq9PohXucMP4aCYhLKbojQHmHs3Nor66iA6XLOGyB72336VGWq4TrCo0zahYyny
	 Ya+OFzY9rlUmmOj2+IbcvqNtd4RwAMQ0GVVoKAz4=
Date: Wed, 16 Sep 2026 09:11:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] thunderbolt: Make PCIe NHI support opt-in
Message-ID: <2026091611-backward-monogram-82e7@gregkh>
References: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>

On Tue, Sep 15, 2026 at 07:04:10PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> With more implementations coming in, one may desire not to enable
> support for the PCIe-attached NHIs. Allow it to be built as a module
> atop the framework.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Why would you not want this?  Can hardware not provide this for some
platforms?  I thought it was part of the spec...

thanks,

greg k-h
