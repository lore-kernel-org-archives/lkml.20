Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914042;
	b=q816WZ41QG++bVd7Atu3hYdgY8UcioieNRtWiwIEseqIWXtXo0acaq22ph3VCybS8p08
	 GW4eDRaklP3j+mPwYlXhcOI2OX2/dJ9CyKpdvWoyG3o1ff8i477DXKE/yb0tP2Un1PCuB
	 lcCWQ+/38brN3f8t07cFmLjIDDv60p+03fb/tVyYEj/L6u62gms7j1xH4tJkiJis3Hlr+
	 iqySHRiTa+1iLBRrt6bBUZvMJpxRHCBbYLkFKMcC5HCz0tKFY6F8c4UV55iFdVWa5/LOg
	 CMQRBpzqTs3EsO7Q7A5iIItoeTIG0BUMhd3hvqfd7iv9CNK4TXzCzYcv1/y736W576Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914042;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9H04yuSe4iuUyFfUm6ir/Pk1kCN7uCCpIfbwJZv1Sk4=;
	b=ESjyy5SRFKYbHQlRVrk7UEfbDgdP4mRcJNIP++BoFKk1PbNWDPo7rtgczYdtEj3Nz//I
	 ni3JWebIht7CTLuEKDyRcNKf+puE51i3ibv7YFMxqWSRaS8gp3MHUyhxH0jih8Ex4bI8U
	 BR0jqRaBEIMkyD19Brtr3/7Gj4c0dFEDDV4+UZ0+vANHWECyOdVdysHROhkW2Dtv3WID7
	 UHhluUqozjjwB1hTl5N74+vqIcjidtiCOi24szaChSarm6vgTQezIgEbjCerS0Vz4fLMA
	 iSxfVIg9N00xsSWx2eYTZxs0bKxcfQ/3yYHTn51VdQiAF5GdR11LV88n+QqVT4vBszA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dywW+YKN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC9606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dywW+YKN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189481F000C6;
	Tue, 17 Nov 2026 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794914042;
	bh=9H04yuSe4iuUyFfUm6ir/Pk1kCN7uCCpIfbwJZv1Sk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dywW+YKN6iJyQppnuJmCfBzF0LdqirAKoczgl5PvqKoHHoaL661RXS+DxDEnvakOZ
	 tWNpIiRvPOKmY8jsrsVTueqzkapr32vz1f/iC4HwgIHrUw8CnQ3zAJXokrOopQRcjY
	 xnTbhh0sOCpBrz+BDxs4e9T+0EZcN+2lQv54cxWjMZ4nWlp7O/JRYx0VMVnsYJXqi5
	 gB2iRGo0XM1oGw38o6vTr8O/8Qnam65eUY3jH0vvneQxSJw/gHHJErvVnfZwJgx/E2
	 d6pTtTL+qqzM48yE5GZARbm6WgsA2BIeiaaTICcz9efG/Y/jm6aWVjmJhngFp71niI
	 t1ZwJhqeT3Jzw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6D2AC198004A;
	Tue, 17 Nov 2026 06:13:53 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 17 Nov 2026 06:13:58 -0500
X-ME-Sender: <xms:8Db8av7h_UOsysMwvcP86csyLI0_L-Y0fG1zP_Y696MEVpVoGSo6pA>
    <xme:8Db8ag_C-YcksC8UEt5JqwVrNrFqw7N4ayelai8n5bDdR44rqlcW-oj-dq30kswsm
    TurKg_DLy8QPcQC18_IVy7cAgSuPNo0ucUTMY8f6Nf3JrRhjkCyWZux>
X-ME-Received: <xmr:8Db8ajJpxWRgU6AnCZfhG1HOiM4eiQeGdPrQuQmTXehknwhbVc9wyuTJqDc>
X-ME-Proxy-Cause: dmFkZTF+JKJTFhO7l5xRceP24AuGfujUQYiZxnoeyK5tA83zfmMRcw5/8FhiWDYeqCSpC6
    T6IC9ySjUHbOB+fpES9ocjUyQ76AHREBXteYhc/tTYbmY+NhXgoz5EC9qWmtA/bgfx1HcQ
    G3d0KvtgMZf8Ub9RJZlly0ltGkym3kClsfEB1T7YifuIlnuXXZdlnKkViCO3FwoDnOOoNU
    fnC07yqnaRgq+GBlBbKihyppy/cbRRiQR+t3z+FOPNU+/WP4gEOzuHSdR4pA8vgm07oi2g
    D3/E4LFSDXcLeLK/W8zOGBJMyubGd8PdT3AVGSvP39vq5QvTlAf9/kSmgnbhnuaJbtvetr
    QZIlkZrx7vANum40gg4v0gwpBxHKHqEL+fAh/bqzhJNG0FBXdi9gYVPQv7BV+zxuXkiHFx
    P9td+ZlRXFYdDU4DOehwuQZzkfrT5O4hw9eNghGseaPrMxtOOlyqszK/SsGikF0QYZdFuI
    ULcq/QuFEs6cf00KI/A6/Bvr+f1CfBwzCXierY4ahyW6eSdqVyCzpz6dFMaQV/LqCuPMtd
    k5OGuumM1Gv1yTxagC6J7H7NVrKyRWfZxMOGd5YwkFsimiV5aStmtxkyBAyFahfVVFV+Uv
    VHwuJSGk7buXeLxgT9ESlFGJXKATIALexZo+JJBnJbrq7qBblldkdK45j4MQ
X-ME-Proxy: <xmx:8Db8amfk0bunvDgiA6VEpYeOjqUloHypf2omjhvAtlcxCPmRt6ku3w>
    <xmx:8Db8aiqEz6AHO-G1dIo6Cxt0yxpSiwmh59qHZ_AOWG-Fbk10sRnv5Q>
    <xmx:8Db8anvHdUtnZwFV0GXcOVB8a_cROsYdtUX45OOlP2nTmQ2wKh4j-A>
    <xmx:8Db8arci-RC-UdiaB5yKwSiLiY2Db1UCTL5QN-r_ic6fok36Lv83IA>
    <xmx:8Db8akoOfVKWmLDdEFAHbFQrDXgCaRW25TF24W6hN7Ryn2vZzkFQ0TXE>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 06:13:52 -0500 (EST)
Date: Tue, 17 Nov 2026 11:13:51 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, apopple@nvidia.com, 
	byungchul@sk.com, david@kernel.org, gourry@gourry.net, jannh@google.com, 
	joshua.hahnjy@gmail.com, liam@infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, matthew.brost@intel.com, 
	mhocko@suse.com, pfalcato@suse.de, rppt@kernel.org, surenb@google.com, 
	vbabka@kernel.org, ying.huang@linux.alibaba.com, ziy@nvidia.com, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] fs/proc/task_mmu: account device-private PMDs as
 present in smaps
Message-ID: <avw25cL2uCsbuPpC@shutemov.name>
References: <20261116063624.1382944-1-usama.arif@linux.dev>
 <20261116063624.1382944-5-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116063624.1382944-5-usama.arif@linux.dev>

On Sun, Nov 15, 2026 at 10:34:58PM -0800, Usama Arif wrote:
> Device-private PMDs represent mapped pages, but smaps_pmd_entry()
> passes present=false to smaps_account(). That treats them like migration
> entries: mapcounts are ignored, PSS is charged in full, and exclusive
> mappings are accounted as shared.
> 
> Match smaps_pte_entry() and mark device-private PMDs as present so
> smaps_account() uses mapcounts for PSS and private/shared accounting.
> 
> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
