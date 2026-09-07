Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF193F23BB;
	Mon,  7 Sep 2026 04:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754250; cv=none; b=E+eG9xP7GF0D4VR4Sn3BlDa208/RKqCwmQ7h8JqWqA/hLccqeReVMNf4zeujHURJnpcmhIYSc70mgWhQSwzYTT+zJM1qLD5Jiz9kJqs1A9rDbm+ZdM+j9QYJ72BZAAexhq6GqP0NQVPEETGAGkCfZb3VuEXr955AN5vgRYvUfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754250; c=relaxed/simple;
	bh=rysrVxfyC2Gic+LgxB3Yf7L99z077dSq0IG+GR8JkUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWA/MkdJJs/APKucMyAVqJ8BGQ2NhwxHbNlz1kXN/ae+bNwSGantpsVRjOK2P6Ivm7nxhQj7RZcHub4QlO1ZHIJ7gMF+VWCBWR9XCtA7vTnpl8c89jMsfd6zU8G+1qwoDpUMyej8MtJEHisjUJYnmG20bdJKhKHs1/SVn6/1ZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtcN+fp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtcN+fp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F1B1F00A3D;
	Mon,  7 Sep 2026 04:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788754248;
	bh=SIQo21kaeDrrS7Ww6h7XcMPG0iBRF7VkctYX/MNJo0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dtcN+fp4X/EsKgfmhY+zOnoN7xfCppyHJwXDP1a1igQ0qBfARLz/YsFKK0Rco8vzg
	 p+g2wCikHljLRz4x50nekt96U/lqnEeGon8eDQe2EHxmqaoFo2Me/cD3JNelvu4StW
	 iwjETDN7WCXZQvq0Pe/gx1YYG4J3/SRYuvJrOshajm4tEvgLyyY9Qs8mJGfy6Xn5jY
	 RAzMl9piHvZ3FhX27FCPvFrcAiYAl5cdhQ+flBSghADWt5LmQ2FTdD9VvCd+oWTW20
	 iQgySib7r+32eYCg8l6wK6CMilXih32jAMhJ5CjR5BTxd1QsfkjaUfljPB/y/Iz5Yj
	 fPrk/wrrHc3SQ==
Date: Mon, 7 Sep 2026 04:10:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 2/2] platform/chrome: fix repeated word 'from' in comment
Message-ID: <ap45RoftDrHQ2TK4@google.com>
References: <20260904110900.20435-1-hemanth.selam@gmail.com>
 <20260904110900.20435-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904110900.20435-3-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 04:38:58PM +0530, Hemanth Selam wrote:
> Drop the second 'from', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[2/2] platform/chrome: fix repeated word 'from' in comment
      commit: 5859f97c6f404d07e89fe9c0d20a318ebf200bd1

Thanks!
