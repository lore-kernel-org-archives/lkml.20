Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D64D4AB1CF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002646; cv=none; b=lqJj/OJ27BtvCWhjIgW0f+FcUUEJno1KLbp/0D2aiW2nNMBmvwEY8heSVKkv21O639GZwcULtlBhaKRa6DZHA61heI9rfUzQlvUQ2IEBGm2ENp9XCpxVuunDOlWZEZey9kDDn5EboGdqQWnIEIiduxGfUg7hHoBytqra/XaYSmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002646; c=relaxed/simple;
	bh=h/e4AULhjSmntZab1cGdfq7OkJUisqf0YdE9X03GDLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gyD9UgzPfQu+vJm6RADoZNlrWS/OWZPvNSWa03xkjEjAjiDmrKsElAffYyBc1gj4kFZ3cxEF8uHeVFUaehtJyKW/VEZZaEppaQ7Z+T2w49ZEjDkLMWk6aEkQZ+NgcrLdZHdEAr+W726+YqQThNHZGe9kDqxsiyjhfGA9iXL0yXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e66652cc3so16719675e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002637; x=1790607437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXSW6q1NZ2VUKtjXQJBrCrLariG7HqyHLR8Ed7NC5Gs=;
        b=U7iMBVcysn+pBQ8FN3dR7zssdtBGtcv1q0TxG5O1p9gmVDmlswIlX/6V86ZZeGAPPi
         T5WiN37fvk/U+72321EnL5FG8dSkhvQrbu2O4vdLuX95OeLhg3PkjDLsrCUMNDZrRcbI
         mv9Grw6nwBwH7KnQjcaplrl5Anv81qD12fggR1kUp0dsoPyAQ+uTAMyTxREvXQ4IJ+tS
         pDNmFo28UaBwedclb+s3PziVvc5qs9PVtPBHQJlKZ/F4rVZAN03lxP720oZ3j4N600Rl
         HJmsz4s8vL0kNQR15WogGOTHHpA4xpHjG+bjWxLDQntaV2rfu6AEhzdOSjJO6DPeIxXe
         7x9w==
X-Forwarded-Encrypted: i=1; AKwUvBy0KnwSe8NjfBmwwJS/C3zWhcsSn+mdYKIz60ExJwjLLv1jrTAe63BxzKg1BmEsfqVLPzmpLc+Exa2MKqg=@vger.kernel.org
X-Gm-Message-State: AFuF++nJd7W4vVC0nR6CgSCFRcLVAsrj58IyJgUy8iQochBKc86AJyCs
	9OGL7Ofps7BT01XtRvKzJ0ddwKUrflDG+XLZMwV+tMFSj6DGVD95dhde
X-Gm-Gg: AYBFou3zYIMs5WMgg/1rklIE+vxokGjsKmofmv7V2p8sy69B7/s6tBs/YR0bynYRr9R
	u9aBp8YNOtCWSN49AOWRcktvXjANvxEgSXW1s3ZstG/w3jJlxRbI+JDQ0TJjmcsSRdJMe0LVaY2
	jaMdfZm+nP19MClnFSFpLzkGquL841fWZ04Q7gIBanbGRpP1KgfLpcdlpZLDiiLT0XCKDuueMim
	i550N/3RXjvtapRhoRJxYJI3gKFluMJGaqvlnMzLzkyN1SElnIqUiM+5EGPFtFpHBsEjpnYYlFv
	VfKZ7M4kGCFw3kzdizX3jHdtnLSJIikg9EssG0sa6+MG/g2aj//1NmrkdTIPLiSSKW+ihln1VFV
	X1/7m55D0dZMTO1Juf9tMpEEBEn5cSZS1KCrVDa9TTsekrBlRmCi9xbJUWxVgLbdNk+aF2WBIde
	ZTjUmISD9HwX8wvXe27oz2Y49CXn2asQy/lwToTYj+khdNN8Er9EQYpqmgMZSZrD2k7PZdGCZdj
	yyY0UV3olMhq0TKCMoD38x+Z7RjBapQkveT2xTGSQ9dEwYa/hiJ
X-Received: by 2002:a05:600d:4453:10b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-49fcbf1e9eamr90041305e9.10.1790002636893;
        Mon, 21 Sep 2026 07:57:16 -0700 (PDT)
Received: from im-t490s.redhat.corp (78-80-107-225.customers.tmcz.cz. [78.80.107.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm243153905e9.3.2026.09.21.07.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:57:16 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	dev@openvswitch.org,
	Ilya Maximets <i.maximets@ovn.org>,
	stable@vger.kernel.org
Subject: [PATCH net 2/6] net: openvswitch: conntrack: remove 'add_helper' dead code
Date: Mon, 21 Sep 2026 16:55:44 +0200
Message-ID: <20260921145655.3167436-3-i.maximets@ovn.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921145655.3167436-1-i.maximets@ovn.org>
References: <20260921145655.3167436-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This variable can only become 'true' when the connection is not
confirmed, but it is only checked when it is confirmed.  So, it can be
treated as being always false and just removed.

Fixes: 3c1860543fcc ("openvswitch: add nf_ct_is_confirmed check before assigning the helper")
Cc: stable@vger.kernel.org
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/openvswitch/conntrack.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index a733029c28dd0..c20f096eef40e 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -778,8 +778,6 @@ static int __ovs_ct_lookup(struct net *net, struct sw_flow_key *key,
 
 	ct = nf_ct_get(skb, &ctinfo);
 	if (ct) {
-		bool add_helper = false;
-
 		/* Packets starting a new connection must be NATted before the
 		 * helper, so that the helper knows about the NAT.  We enforce
 		 * this by delaying both NAT and helper calls for unconfirmed
@@ -811,7 +809,6 @@ static int __ovs_ct_lookup(struct net *net, struct sw_flow_key *key,
 							    GFP_ATOMIC);
 			if (err)
 				return err;
-			add_helper = true;
 
 			/* helper installed, add seqadj if NAT is required */
 			if (info->nat && !nfct_seqadj(ct)) {
@@ -821,13 +818,10 @@ static int __ovs_ct_lookup(struct net *net, struct sw_flow_key *key,
 		}
 
 		/* Call the helper only if:
-		 * - nf_conntrack_in() was executed above ("!cached") or a
-		 *   helper was just attached ("add_helper") for a confirmed
-		 *   connection, or
+		 * - nf_conntrack_in() was executed above ("!cached"), or
 		 * - When committing an unconfirmed connection.
 		 */
-		if ((nf_ct_is_confirmed(ct) ? !cached || add_helper :
-					      info->commit)) {
+		if ((nf_ct_is_confirmed(ct) ? !cached : info->commit)) {
 			int err = nf_ct_helper(skb, ct, ctinfo, info->family);
 
 			err = verdict_to_errno(err);
-- 
2.55.0

