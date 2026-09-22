Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271554DAD1;
	Tue, 22 Sep 2026 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092712; cv=none; b=mwsg8J3lqCzhSc2CzifBLEI/GCPgUgJI3ZsVPt9s12JDG/3t9MloFaP9FI/yArSel8pKtnqlUcbCeif3OVpJkS7GQCwxUXzWYcMvbEp5HOVFtEVl8i8wdYxKL6PfhzjVFbJVXVcne7vE6z2UjfdioWZ5Lsdrd7zhWA8x2L40Dg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092712; c=relaxed/simple;
	bh=aUmZ3Aswi0fVFdjjTWrZrWqyxs3WCZ6UUsJQDy5ef6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=meFqqwI3EObezxANX/IzEaPf7E4MNB4Z2XYnLCJz4VT1RnKOanhS7+hsdXNylZbB5OOEyHyaNExCGt5gc3wr+iyVG06zKixQ+QzJVsfJiENj+73uit8E4g/OzQxCJ2bL6isO3OMNG9BlfkRVeJ2/Zb4eUCoiUe28VxeP+iKh0+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiakvtAn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiakvtAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5ED1F00898;
	Tue, 22 Sep 2026 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790092711;
	bh=bjDpA98pFT6nyTG8yt3HNO8G/IhWyor/kYI7U98a7SI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CiakvtAnCcDEbYpIKdJzJSJcYX0aPZjThl97arjdzh60frFeZNpalhyXRUg3Jyaeo
	 p71nesYbSJoyWp3DwTRe3L4b2p0X11aFlpIc+w3F4dIYT4Ww7GpyIhnIcNjEMsgXF/
	 97rNBjkXsHz/25BPNgKFukwN6Q4USEkxI3/ERPLVK/4PxSr6F1vaE5FoRCh4pkFrJf
	 XHN2HSZY7Q3Mf8Z302wKsifoUM59lAKo2z1MvVbPZ2r1JCKFFZoR93Yt35jPVNhOBZ
	 OdhZYvLaTDGxAPHt0biipq3jwZfGSHP3TjbB+nM9OGIZDgwW7poyMdF4XDdVSZnwcW
	 eTstWKBdGI5zQ==
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>, Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
Subject: Re: [PATCH v7 0/4] mfd: intel-lpss: Clean up and modernize DebugFS
 usage
Message-Id: <179009271005.3476021.7155755884773443613.b4-ty@b4>
Date: Tue, 22 Sep 2026 16:58:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 16 Sep 2026 21:23:46 +0500, Maria Lisina wrote:
> This series cleans up DebugFS code, modernizes it by replacing
> obsoleted macros and removes redundant error checking.

Applied, thanks!

[1/4] mfd: intel-lpss: Remove redundant DebugFS error check
      commit: e32f0b4eb5e799a36ddc13748a56a23e5682d886
[2/4] mfd: intel-lpss: Use plain octal values for file permissions
      commit: bf5001e060762dbb931274db0ad6669492d8150e
[3/4] mfd: intel-lpss: Remove extra DebugFS dentry
      commit: 359ec8b51b4e37fe6435bac44e57f25d0feb346c
[4/4] mfd: intel-lpss: Switch to debugfs_remove()
      commit: 0ab0127dd7445a5e260c97c7d4f792322d0e49be

--
Lee Jones [李琼斯]

