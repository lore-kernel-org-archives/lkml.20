Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A512741B6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789954969; cv=none; b=B4Ml2o7THvN26cNC2B+kKlSVoUiBxLzAzQb6CJNAC8Qb14oVkPYrunk82/Y+L8irqsh/FCqGXWuocQ23tb1lFva+pXU3mZcdxAkUlP4p4a2r0mbhyTBShdEIBvCiufkJ2ejcH6A2TVMyZiJ3vwifo3/Bz2293hNdGzCNroGd/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789954969; c=relaxed/simple;
	bh=DWVt9+tgRutO33g/JPjgaS+vnsJ1FuBmWnYngZFepIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5rnQwwK1FQCQmupXH9fVZkEsJgo3ANtaevnMvVcVYLgAbDHftI8wTrW5mYEvDnANthNnGDfH5+5oSBVrH/6R2jLcJyqOQuAyLpfEb6rsii0k9exdUHDWiTMXCdYwMb5KGJz0WQKao6SxHFYy8LPoS0AnWacWsQcnsQ7iO5E+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9+8swQU; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9+8swQU"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304833so1682501a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789954967; x=1790559767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAwJLJRI1juBA2aagV/5DfGdvOb77xC4nzYYwed9V5Y=;
        b=d9+8swQUIFIpfmYVbnP+toi02K2s1PwaiqiRw78GgUukq0+5ZxKN2ZDr7pg/+eGtkT
         rIxyRyASX+ji7wmrjHGe7UTS6Owzn1x5pH71QLk6z2b2wyCFsKHhp2N60BmXuOEUjpTn
         HCNb4Is6DTlVycscY+idq5nkbPzyxDc/vHbBiL4tzq3QM0dYZ6/e60eQfeF5kyD9voc9
         oUFgN20kw/GDdvZGzdLXCgeszRuIYBX2EhMukBmTLsWfHeEX8qGUYFMaBb5w8NYtJocp
         NZqbi8lGG4ELlsKowFp6g31IohUtUeBrt4bOzEnGLoJ8SxPEJrQkp8YclQJcl+lgPkZ0
         BK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789954967; x=1790559767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAwJLJRI1juBA2aagV/5DfGdvOb77xC4nzYYwed9V5Y=;
        b=pizcdA2MmB78nNXKZiovLdEyIqyjFuXd0RLJP4Q0Wy6yMsPPh8KsQiuqMYnOgA8Xlz
         mlCykNLkWm4tmwUdNKXRwnONDxXQSrVi+zwpU+Cr2rmSlqOze/W9cfqKYgRr/HJBjEDo
         4fStWKPLytYTfuKdXpitKBlITLVoR6cC3IMDD9uBvSR4d2egq3vSN65q7fDg6dKuIWtw
         9vvouK078S9dHCbsK/gWIg0J3PXafvqKT3dQkL0kkDS3GbwqgTGdgFtV98QDdNifenjy
         q9WspQ4IphVLvIuZ4OMIlqVs09xV7MdVjJaBV693aUdv8Ea7W17j4P3EoNKhhg0+oAnT
         oP5g==
X-Forwarded-Encrypted: i=1; AKwUvBxb5tdWkQEuvoCTQ8/Tt2MvFHtYSUpXNVvxZYLCpay9KsiIzk7zs01cYBC8QvNX8nuMjKJPVsnUQraS1Ys=@vger.kernel.org
X-Gm-Message-State: AFuF++lmyOPQMChDbUglyrFHX55L3Ht5O/0ZKTKrGzdvX4ZzdG6bOplm
	sO9kLiEAEQ7NcNZtmyfNot++rXg0VHklj3RgClIv/OLtd2BJHIAXqTja
X-Gm-Gg: AYBFou2RcJqByziN4nMbFThnBU8V/WMj2MXVdzha0DM4dtRWxU5/TZcOeuNJGdb3DVg
	SkdKc/NudRA+18dKrTks0P1eBDT9Q/cdRgKwUaMZ09gRzGrrd32LE1jXcy7HDtJ/c4sy74ux7bH
	QQh+G77SHDhZcZ/liiG8P8dQeQjhllYzc2kGfPLdTqnoQ6tfX79sm1M9TJtmmiVVNagiJeR6cNV
	cG/QrWVjd15e90N5rQe5Qwm27rCiPI7MrEHHLM/npF+pjPbe/7AkGHHG5o8i53iZIP/9DM65wBo
	t0vPtd68XWUyJd2wt2pd3+Eu1wM/WcVrLO4ZxdGeCd0NSdsnWn9pJ/iIoBpUj/cLr/gQTAL9ldd
	WS/FLAWkqfeADKCR+WBCul4mG0Rs/XgB+7NRnjVl3PzMx6/CC47II6kXRFkffE6Gyo51Mw6G9y6
	LUq6TsnLtAkwL9tDWqFWbzsQ0sfRZR7bNJfkrBjbPT7KhCrT/P01qffpEzLEc78/2mw9lDxLiF5
	VG44V2gxKSL5zjU+HN4q4bNf5Z+ZVUUq7zcf5T5fq+tLrgrexBAOqwzud1QCKwS9Pwa577sf2PK
	4FTPKQ+kSg==
X-Received: by 2002:a17:90b:6c5:b0:3a0:295e:6e58 with SMTP id 98e67ed59e1d1-3a0295e7719mr5642329a91.2.1789954967119;
        Sun, 20 Sep 2026 18:42:47 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cabafbasm11468127a91.10.2026.09.20.18.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:42:46 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hui Peng <benquike@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: clear both ep_in and ep_out for non-ep0 control endpoints
Date: Mon, 21 Sep 2026 01:42:44 +0000
Message-ID: <20260921014244.711023-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <fea9a6f7-b6d1-4b20-968d-a306ee4b4e80@rowland.harvard.edu>
References: <20260919223518.3890208-1-benquike@gmail.com> <0bc9c10f-6b6e-429c-a625-d34b12aaf2ef@rowland.harvard.edu> <20260920231702.110963-1-benquike@gmail.com> <fea9a6f7-b6d1-4b20-968d-a306ee4b4e80@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 20, 2026 at 8:21 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
> You might consider looking through other parts of the code to see if
> they need similar attention.  Historically we haven't been very good
> about supporting control endpoints other than ep0.
>
> Alan Stern

Thank you for the review and Acked-by, Alan.

We will audit the rest of the USB core and host controller paths for
non-ep0 control endpoint handling, and if we find any additional issues,
we will report and submit them in separate patches.

Best regards,
Hui Peng
